cmd_drivers/input/input-polldev.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/input-polldev.ko drivers/input/input-polldev.o drivers/input/input-polldev.mod.o
