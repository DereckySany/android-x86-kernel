cmd_drivers/input/joystick/tmdc.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/joystick/tmdc.ko drivers/input/joystick/tmdc.o drivers/input/joystick/tmdc.mod.o
