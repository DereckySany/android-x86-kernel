cmd_drivers/net/wireless/rndis_wlan.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/net/wireless/rndis_wlan.ko drivers/net/wireless/rndis_wlan.o drivers/net/wireless/rndis_wlan.mod.o
