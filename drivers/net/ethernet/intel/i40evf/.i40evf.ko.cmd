cmd_drivers/net/ethernet/intel/i40evf/i40evf.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/ethernet/intel/i40evf/i40evf.ko drivers/net/ethernet/intel/i40evf/i40evf.o drivers/net/ethernet/intel/i40evf/i40evf.mod.o
