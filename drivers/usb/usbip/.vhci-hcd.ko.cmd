cmd_drivers/usb/usbip/vhci-hcd.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/usbip/vhci-hcd.ko drivers/usb/usbip/vhci-hcd.o drivers/usb/usbip/vhci-hcd.mod.o
