cmd_drivers/hid/hid-roccat-lua.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-roccat-lua.ko drivers/hid/hid-roccat-lua.o drivers/hid/hid-roccat-lua.mod.o
