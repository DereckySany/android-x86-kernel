cmd_drivers/net/usb/pegasus.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/usb/pegasus.ko drivers/net/usb/pegasus.o drivers/net/usb/pegasus.mod.o
