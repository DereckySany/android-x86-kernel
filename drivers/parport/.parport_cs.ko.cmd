cmd_drivers/parport/parport_cs.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/parport/parport_cs.ko drivers/parport/parport_cs.o drivers/parport/parport_cs.mod.o
