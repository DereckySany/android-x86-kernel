cmd_drivers/memstick/core/mspro_block.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/memstick/core/mspro_block.ko drivers/memstick/core/mspro_block.o drivers/memstick/core/mspro_block.mod.o
