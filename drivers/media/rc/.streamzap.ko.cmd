cmd_drivers/media/rc/streamzap.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/media/rc/streamzap.ko drivers/media/rc/streamzap.o drivers/media/rc/streamzap.mod.o
