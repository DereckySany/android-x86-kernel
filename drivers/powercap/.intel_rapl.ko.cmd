cmd_drivers/powercap/intel_rapl.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/powercap/intel_rapl.ko drivers/powercap/intel_rapl.o drivers/powercap/intel_rapl.mod.o
