cmd_drivers/input/mouse/appletouch.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/mouse/appletouch.ko drivers/input/mouse/appletouch.o drivers/input/mouse/appletouch.mod.o
