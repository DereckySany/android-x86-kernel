cmd_drivers/usb/serial/opticon.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/opticon.ko drivers/usb/serial/opticon.o drivers/usb/serial/opticon.mod.o
