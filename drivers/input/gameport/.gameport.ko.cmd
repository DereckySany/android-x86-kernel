cmd_drivers/input/gameport/gameport.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/gameport/gameport.ko drivers/input/gameport/gameport.o drivers/input/gameport/gameport.mod.o
