cmd_drivers/input/joystick/xpad.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/joystick/xpad.ko drivers/input/joystick/xpad.o drivers/input/joystick/xpad.mod.o
