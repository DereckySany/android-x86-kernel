cmd_drivers/bluetooth/btmrvl.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/btmrvl.ko drivers/bluetooth/btmrvl.o drivers/bluetooth/btmrvl.mod.o
