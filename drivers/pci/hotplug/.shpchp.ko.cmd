cmd_drivers/pci/hotplug/shpchp.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/pci/hotplug/shpchp.ko drivers/pci/hotplug/shpchp.o drivers/pci/hotplug/shpchp.mod.o
