cmd_drivers/input/touchscreen/mtouch.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/input/touchscreen/mtouch.ko drivers/input/touchscreen/mtouch.o drivers/input/touchscreen/mtouch.mod.o
