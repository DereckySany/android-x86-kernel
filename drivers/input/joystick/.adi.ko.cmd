cmd_drivers/input/joystick/adi.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/joystick/adi.ko drivers/input/joystick/adi.o drivers/input/joystick/adi.mod.o
