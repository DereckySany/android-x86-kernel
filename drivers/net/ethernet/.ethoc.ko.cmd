cmd_drivers/net/ethernet/ethoc.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/ethernet/ethoc.ko drivers/net/ethernet/ethoc.o drivers/net/ethernet/ethoc.mod.o
