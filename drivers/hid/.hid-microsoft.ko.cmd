cmd_drivers/hid/hid-microsoft.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-microsoft.ko drivers/hid/hid-microsoft.o drivers/hid/hid-microsoft.mod.o
