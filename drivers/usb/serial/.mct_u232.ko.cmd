cmd_drivers/usb/serial/mct_u232.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/mct_u232.ko drivers/usb/serial/mct_u232.o drivers/usb/serial/mct_u232.mod.o
