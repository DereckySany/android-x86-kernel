cmd_drivers/hid/hid-kensington.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-kensington.ko drivers/hid/hid-kensington.o drivers/hid/hid-kensington.mod.o
