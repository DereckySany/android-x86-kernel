cmd_drivers/pcmcia/yenta_socket.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/pcmcia/yenta_socket.ko drivers/pcmcia/yenta_socket.o drivers/pcmcia/yenta_socket.mod.o
