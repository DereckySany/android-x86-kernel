cmd_drivers/hid/hid-multitouch.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-multitouch.ko drivers/hid/hid-multitouch.o drivers/hid/hid-multitouch.mod.o
