cmd_drivers/parport/parport_pc.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/parport/parport_pc.ko drivers/parport/parport_pc.o drivers/parport/parport_pc.mod.o
