cmd_drivers/net/ethernet/fealnx.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/ethernet/fealnx.ko drivers/net/ethernet/fealnx.o drivers/net/ethernet/fealnx.mod.o
