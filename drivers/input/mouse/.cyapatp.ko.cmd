cmd_drivers/input/mouse/cyapatp.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/mouse/cyapatp.ko drivers/input/mouse/cyapatp.o drivers/input/mouse/cyapatp.mod.o
