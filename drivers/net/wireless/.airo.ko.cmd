cmd_drivers/net/wireless/airo.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/wireless/airo.ko drivers/net/wireless/airo.o drivers/net/wireless/airo.mod.o
