cmd_drivers/input/mouse/sermouse.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/mouse/sermouse.ko drivers/input/mouse/sermouse.o drivers/input/mouse/sermouse.mod.o
