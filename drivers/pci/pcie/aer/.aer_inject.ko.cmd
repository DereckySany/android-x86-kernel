cmd_drivers/pci/pcie/aer/aer_inject.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/pci/pcie/aer/aer_inject.ko drivers/pci/pcie/aer/aer_inject.o drivers/pci/pcie/aer/aer_inject.mod.o
