cmd_drivers/net/ethernet/packetengines/hamachi.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/ethernet/packetengines/hamachi.ko drivers/net/ethernet/packetengines/hamachi.o drivers/net/ethernet/packetengines/hamachi.mod.o
