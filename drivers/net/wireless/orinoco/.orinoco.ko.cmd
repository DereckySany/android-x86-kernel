cmd_drivers/net/wireless/orinoco/orinoco.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/wireless/orinoco/orinoco.ko drivers/net/wireless/orinoco/orinoco.o drivers/net/wireless/orinoco/orinoco.mod.o
