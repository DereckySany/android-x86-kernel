cmd_drivers/usb/misc/usbled.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/misc/usbled.ko drivers/usb/misc/usbled.o drivers/usb/misc/usbled.mod.o
