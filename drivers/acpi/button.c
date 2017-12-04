/*
 *  button.c - ACPI Button Driver
 *
 *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
 *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or (at
 *  your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  General Public License for more details.
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/input.h>
#include <linux/slab.h>
#include <linux/acpi.h>
#include <linux/dmi.h>
#include <acpi/button.h>
#include "internal.h"

#define ACPI_LID_CACHE_OPEN			1
#define ACPI_LID_CACHE_CLOSE			0

#define _COMPONENT		ACPI_BUTTON_COMPONENT
ACPI_MODULE_NAME("button");

MODULE_AUTHOR("Paul Diefenbaugh");
MODULE_DESCRIPTION("ACPI Button Driver");
MODULE_LICENSE("GPL");

static const struct acpi_device_id button_device_ids[] = {
	{ACPI_BUTTON_HID_LID,    0},
	{ACPI_BUTTON_HID_SLEEP,  0},
	{ACPI_BUTTON_HID_SLEEPF, 0},
	{ACPI_BUTTON_HID_POWER,  0},
	{ACPI_BUTTON_HID_POWERF, 0},
	{"", 0},
};
MODULE_DEVICE_TABLE(acpi, button_device_ids);

static int acpi_button_add(struct acpi_device *device);
static int acpi_button_remove(struct acpi_device *device);
static void acpi_button_notify(struct acpi_device *device, u32 event);

#ifdef CONFIG_PM_SLEEP
static int acpi_button_suspend(struct device *dev);
static int acpi_button_resume(struct device *dev);
#else
#define acpi_button_suspend NULL
#define acpi_button_resume NULL
#endif
static SIMPLE_DEV_PM_OPS(acpi_button_pm, acpi_button_suspend, acpi_button_resume);

static struct acpi_driver acpi_button_driver = {
	.name = "button",
	.class = ACPI_BUTTON_CLASS,
	.ids = button_device_ids,
	.ops = {
		.add = acpi_button_add,
		.remove = acpi_button_remove,
		.notify = acpi_button_notify,
	},
	.drv.pm = &acpi_button_pm,
};

struct acpi_button {
	unsigned int type;
	struct input_dev *input;
	char phys[32];			/* for input device */
	unsigned long pushed;
	bool suspended;
	unsigned long long cache_state;
};

static int use_lid_cache_state;
static BLOCKING_NOTIFIER_HEAD(acpi_lid_notifier);
static struct acpi_device *lid_device;

/* --------------------------------------------------------------------------
                              FS Interface (/proc)
   -------------------------------------------------------------------------- */

static struct proc_dir_entry *acpi_button_dir;
static struct proc_dir_entry *acpi_lid_dir;

static int acpi_button_state_seq_show(struct seq_file *seq, void *offset)
{
	struct acpi_device *device = seq->private;
	acpi_status status;
	unsigned long long state;
	struct acpi_button *button = acpi_driver_data(device);

	status = acpi_evaluate_integer(device->handle, "_LID", NULL, &state);

	if (use_lid_cache_state)
		state = button->cache_state;

	seq_printf(seq, "state:      %s\n",
		   ACPI_FAILURE(status) ? "unsupported" :
			(state ? "open" : "closed"));
	return 0;
}

static int acpi_button_state_open_fs(struct inode *inode, struct file *file)
{
	return single_open(file, acpi_button_state_seq_show, PDE_DATA(inode));
}

static const struct file_operations acpi_button_state_fops = {
	.owner = THIS_MODULE,
	.open = acpi_button_state_open_fs,
	.read = seq_read,
	.llseek = seq_lseek,
	.release = single_release,
};

static int acpi_button_add_fs(struct acpi_device *device)
{
	struct acpi_button *button = acpi_driver_data(device);
	struct proc_dir_entry *entry = NULL;
	int ret = 0;

	/* procfs I/F for ACPI lid device only */
	if (button->type != ACPI_BUTTON_TYPE_LID)
		return 0;

	if (acpi_button_dir || acpi_lid_dir) {
		printk(KERN_ERR PREFIX "More than one Lid device found!\n");
		return -EEXIST;
	}

	/* create /proc/acpi/button */
	acpi_button_dir = proc_mkdir(ACPI_BUTTON_CLASS, acpi_root_dir);
	if (!acpi_button_dir)
		return -ENODEV;

	/* create /proc/acpi/button/lid */
	acpi_lid_dir = proc_mkdir(ACPI_BUTTON_SUBCLASS_LID, acpi_button_dir);
	if (!acpi_lid_dir) {
		ret = -ENODEV;
		goto remove_button_dir;
	}

	/* create /proc/acpi/button/lid/LID/ */
	acpi_device_dir(device) = proc_mkdir(acpi_device_bid(device), acpi_lid_dir);
	if (!acpi_device_dir(device)) {
		ret = -ENODEV;
		goto remove_lid_dir;
	}

	/* create /proc/acpi/button/lid/LID/state */
	entry = proc_create_data(ACPI_BUTTON_FILE_STATE,
				 S_IRUGO, acpi_device_dir(device),
				 &acpi_button_state_fops, device);
	if (!entry) {
		ret = -ENODEV;
		goto remove_dev_dir;
	}

done:
	return ret;

remove_dev_dir:
	remove_proc_entry(acpi_device_bid(device),
			  acpi_lid_dir);
	acpi_device_dir(device) = NULL;
remove_lid_dir:
	remove_proc_entry(ACPI_BUTTON_SUBCLASS_LID, acpi_button_dir);
remove_button_dir:
	remove_proc_entry(ACPI_BUTTON_CLASS, acpi_root_dir);
	goto done;
}

static int acpi_button_remove_fs(struct acpi_device *device)
{
	struct acpi_button *button = acpi_driver_data(device);

	if (button->type != ACPI_BUTTON_TYPE_LID)
		return 0;

	remove_proc_entry(ACPI_BUTTON_FILE_STATE,
			  acpi_device_dir(device));
	remove_proc_entry(acpi_device_bid(device),
			  acpi_lid_dir);
	acpi_device_dir(device) = NULL;
	remove_proc_entry(ACPI_BUTTON_SUBCLASS_LID, acpi_button_dir);
	remove_proc_entry(ACPI_BUTTON_CLASS, acpi_root_dir);

	return 0;
}

/* --------------------------------------------------------------------------
                                Driver Interface
   -------------------------------------------------------------------------- */
int acpi_lid_notifier_register(struct notifier_block *nb)
{
	return blocking_notifier_chain_register(&acpi_lid_notifier, nb);
}
EXPORT_SYMBOL(acpi_lid_notifier_register);

int acpi_lid_notifier_unregister(struct notifier_block *nb)
{
	return blocking_notifier_chain_unregister(&acpi_lid_notifier, nb);
}
EXPORT_SYMBOL(acpi_lid_notifier_unregister);

int acpi_lid_open(void)
{
	acpi_status status;
	unsigned long long state;
	struct acpi_button *button;

	if (!lid_device)
		return -ENODEV;

	button = acpi_driver_data(lid_device);
	if (!button)
		return -ENODEV;

	status = acpi_evaluate_integer(lid_device->handle, "_LID", NULL,
				       &state);
	if (ACPI_FAILURE(status))
		return -ENODEV;

	if (use_lid_cache_state)
		state = button->cache_state;

	return !!state;
}
EXPORT_SYMBOL(acpi_lid_open);

static int acpi_lid_send_state(struct acpi_device *device)
{
	struct acpi_button *button = acpi_driver_data(device);
	unsigned long long state;
	acpi_status status;
	int ret;

	status = acpi_evaluate_integer(device->handle, "_LID", NULL, &state);
	if (ACPI_FAILURE(status))
		return -ENODEV;

	if (use_lid_cache_state)
		state = button->cache_state;

	/* input layer checks if event is redundant */
	input_report_switch(button->input, SW_LID, !state);
	input_sync(button->input);

	if (state)
		pm_wakeup_event(&device->dev, 0);

	ret = blocking_notifier_call_chain(&acpi_lid_notifier, state, device);
	if (ret == NOTIFY_DONE)
		ret = blocking_notifier_call_chain(&acpi_lid_notifier, state,
						   device);
	if (ret == NOTIFY_DONE || ret == NOTIFY_OK) {
		/*
		 * It is also regarded as success if the notifier_chain
		 * returns NOTIFY_OK or NOTIFY_DONE.
		 */
		ret = 0;
	}
	return ret;
}

static void acpi_button_notify(struct acpi_device *device, u32 event)
{
	struct acpi_button *button = acpi_driver_data(device);
	struct input_dev *input;

	switch (event) {
	case ACPI_FIXED_HARDWARE_EVENT:
		event = ACPI_BUTTON_NOTIFY_STATUS;
		/* fall through */
	case ACPI_BUTTON_NOTIFY_STATUS:
		input = button->input;
		if (button->type == ACPI_BUTTON_TYPE_LID) {
			if (use_lid_cache_state)
				button->cache_state = !button->cache_state;
			acpi_lid_send_state(device);
		} else {
			int keycode;

			pm_wakeup_event(&device->dev, 0);
			if (button->suspended)
				break;

			keycode = test_bit(KEY_SLEEP, input->keybit) ?
						KEY_SLEEP : KEY_POWER;
			input_report_key(input, keycode, 1);
			input_sync(input);
			input_report_key(input, keycode, 0);
			input_sync(input);

			acpi_bus_generate_netlink_event(
					device->pnp.device_class,
					dev_name(&device->dev),
					event, ++button->pushed);
		}
		break;
	default:
		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
				  "Unsupported event [0x%x]\n", event));
		break;
	}
}

#ifdef CONFIG_PM_SLEEP
static int acpi_button_suspend(struct device *dev)
{
	struct acpi_device *device = to_acpi_device(dev);
	struct acpi_button *button = acpi_driver_data(device);

	button->suspended = true;
	if (use_lid_cache_state)
		button->cache_state = ACPI_LID_CACHE_CLOSE;

	return 0;
}

static int acpi_button_resume(struct device *dev)
{
	struct acpi_device *device = to_acpi_device(dev);
	struct acpi_button *button = acpi_driver_data(device);

	button->suspended = false;
	if (button->type == ACPI_BUTTON_TYPE_LID) {
		if (use_lid_cache_state)
			button->cache_state = ACPI_LID_CACHE_OPEN;
		return acpi_lid_send_state(device);
	}
	return 0;
}
#endif

static int switch_lid_mode(const struct dmi_system_id *d)
{
	use_lid_cache_state = 1;
	return 0;
}

static struct dmi_system_id broken_lid_dmi_table[] = {
	{
	 .callback = switch_lid_mode,
	 .ident = "Surface Pro 1",
	 .matches = {
		DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
		DMI_MATCH(DMI_PRODUCT_NAME, "Surface with Windows 8 Pro"),
		},
	},
	{
	 .callback = switch_lid_mode,
	 .ident = "Surface 3",
	 .matches = {
		DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
		DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
		},
	},
	{}
};

static int acpi_button_add(struct acpi_device *device)
{
	struct acpi_button *button;
	struct input_dev *input;
	const char *hid = acpi_device_hid(device);
	char *name, *class;
	int error;

	button = kzalloc(sizeof(struct acpi_button), GFP_KERNEL);
	if (!button)
		return -ENOMEM;

	device->driver_data = button;

	button->input = input = input_allocate_device();
	if (!input) {
		error = -ENOMEM;
		goto err_free_button;
	}

	name = acpi_device_name(device);
	class = acpi_device_class(device);

	if (!strcmp(hid, ACPI_BUTTON_HID_POWER) ||
	    !strcmp(hid, ACPI_BUTTON_HID_POWERF)) {
		button->type = ACPI_BUTTON_TYPE_POWER;
		strcpy(name, ACPI_BUTTON_DEVICE_NAME_POWER);
		sprintf(class, "%s/%s",
			ACPI_BUTTON_CLASS, ACPI_BUTTON_SUBCLASS_POWER);
	} else if (!strcmp(hid, ACPI_BUTTON_HID_SLEEP) ||
		   !strcmp(hid, ACPI_BUTTON_HID_SLEEPF)) {
		button->type = ACPI_BUTTON_TYPE_SLEEP;
		strcpy(name, ACPI_BUTTON_DEVICE_NAME_SLEEP);
		sprintf(class, "%s/%s",
			ACPI_BUTTON_CLASS, ACPI_BUTTON_SUBCLASS_SLEEP);
	} else if (!strcmp(hid, ACPI_BUTTON_HID_LID)) {
		button->type = ACPI_BUTTON_TYPE_LID;
		strcpy(name, ACPI_BUTTON_DEVICE_NAME_LID);
		sprintf(class, "%s/%s",
			ACPI_BUTTON_CLASS, ACPI_BUTTON_SUBCLASS_LID);
		dmi_check_system(broken_lid_dmi_table);
	} else {
		printk(KERN_ERR PREFIX "Unsupported hid [%s]\n", hid);
		error = -ENODEV;
		goto err_free_input;
	}

	error = acpi_button_add_fs(device);
	if (error)
		goto err_free_input;

	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);

	input->name = name;
	input->phys = button->phys;
	input->id.bustype = BUS_HOST;
	input->id.product = button->type;
	input->dev.parent = &device->dev;

	switch (button->type) {
	case ACPI_BUTTON_TYPE_POWER:
		input_set_capability(input, EV_KEY, KEY_POWER);
		break;

	case ACPI_BUTTON_TYPE_SLEEP:
		input_set_capability(input, EV_KEY, KEY_SLEEP);
		break;

	case ACPI_BUTTON_TYPE_LID:
		input_set_capability(input, EV_SW, SW_LID);
		break;
	}

	error = input_register_device(input);
	if (error)
		goto err_remove_fs;
	if (button->type == ACPI_BUTTON_TYPE_LID) {
		if (use_lid_cache_state)
			button->cache_state = ACPI_LID_CACHE_OPEN;
		acpi_lid_send_state(device);
		/*
		 * This assumes there's only one lid device, or if there are
		 * more we only care about the last one...
		 */
		lid_device = device;
	}

	printk(KERN_INFO PREFIX "%s [%s]\n", name, acpi_device_bid(device));
	return 0;

 err_remove_fs:
	acpi_button_remove_fs(device);
 err_free_input:
	input_free_device(input);
 err_free_button:
	kfree(button);
	return error;
}

static int acpi_button_remove(struct acpi_device *device)
{
	struct acpi_button *button = acpi_driver_data(device);

	acpi_button_remove_fs(device);
	input_unregister_device(button->input);
	kfree(button);
	return 0;
}

module_acpi_driver(acpi_button_driver);
