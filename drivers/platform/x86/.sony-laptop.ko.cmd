cmd_drivers/platform/x86/sony-laptop.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/platform/x86/sony-laptop.ko drivers/platform/x86/sony-laptop.o drivers/platform/x86/sony-laptop.mod.o
