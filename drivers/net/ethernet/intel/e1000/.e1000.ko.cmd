cmd_drivers/net/ethernet/intel/e1000/e1000.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/ethernet/intel/e1000/e1000.ko drivers/net/ethernet/intel/e1000/e1000.o drivers/net/ethernet/intel/e1000/e1000.mod.o
