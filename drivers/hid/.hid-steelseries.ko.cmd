cmd_drivers/hid/hid-steelseries.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-steelseries.ko drivers/hid/hid-steelseries.o drivers/hid/hid-steelseries.mod.o
