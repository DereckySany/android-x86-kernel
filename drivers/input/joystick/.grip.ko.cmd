cmd_drivers/input/joystick/grip.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/joystick/grip.ko drivers/input/joystick/grip.o drivers/input/joystick/grip.mod.o
