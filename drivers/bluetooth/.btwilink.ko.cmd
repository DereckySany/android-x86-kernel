cmd_drivers/bluetooth/btwilink.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/btwilink.ko drivers/bluetooth/btwilink.o drivers/bluetooth/btwilink.mod.o
