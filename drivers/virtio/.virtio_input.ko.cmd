cmd_drivers/virtio/virtio_input.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/virtio/virtio_input.ko drivers/virtio/virtio_input.o drivers/virtio/virtio_input.mod.o
