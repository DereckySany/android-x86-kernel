cmd_drivers/net/ethernet/intel/igb/igb.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/ethernet/intel/igb/igb.ko drivers/net/ethernet/intel/igb/igb.o drivers/net/ethernet/intel/igb/igb.mod.o
