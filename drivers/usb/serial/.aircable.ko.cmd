cmd_drivers/usb/serial/aircable.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/aircable.ko drivers/usb/serial/aircable.o drivers/usb/serial/aircable.mod.o
