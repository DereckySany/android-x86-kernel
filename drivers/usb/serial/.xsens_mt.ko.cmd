cmd_drivers/usb/serial/xsens_mt.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/xsens_mt.ko drivers/usb/serial/xsens_mt.o drivers/usb/serial/xsens_mt.mod.o
