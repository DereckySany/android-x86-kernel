cmd_drivers/virtio/virtio_mmio.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/virtio/virtio_mmio.ko drivers/virtio/virtio_mmio.o drivers/virtio/virtio_mmio.mod.o
