cmd_drivers/platform/x86/hdaps.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/platform/x86/hdaps.ko drivers/platform/x86/hdaps.o drivers/platform/x86/hdaps.mod.o
