cmd_drivers/usb/serial/ftdi_sio.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/ftdi_sio.ko drivers/usb/serial/ftdi_sio.o drivers/usb/serial/ftdi_sio.mod.o
