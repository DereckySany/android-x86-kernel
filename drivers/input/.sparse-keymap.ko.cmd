cmd_drivers/input/sparse-keymap.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/sparse-keymap.ko drivers/input/sparse-keymap.o drivers/input/sparse-keymap.mod.o
