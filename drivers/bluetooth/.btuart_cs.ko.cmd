cmd_drivers/bluetooth/btuart_cs.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/btuart_cs.ko drivers/bluetooth/btuart_cs.o drivers/bluetooth/btuart_cs.mod.o
