cmd_drivers/platform/x86/intel-rst.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/platform/x86/intel-rst.ko drivers/platform/x86/intel-rst.o drivers/platform/x86/intel-rst.mod.o
