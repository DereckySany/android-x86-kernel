cmd_drivers/char/virtio_console.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/char/virtio_console.ko drivers/char/virtio_console.o drivers/char/virtio_console.mod.o
