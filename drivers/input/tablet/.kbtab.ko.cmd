cmd_drivers/input/tablet/kbtab.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/tablet/kbtab.ko drivers/input/tablet/kbtab.o drivers/input/tablet/kbtab.mod.o
