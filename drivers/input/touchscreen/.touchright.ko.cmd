cmd_drivers/input/touchscreen/touchright.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/touchscreen/touchright.ko drivers/input/touchscreen/touchright.o drivers/input/touchscreen/touchright.mod.o
