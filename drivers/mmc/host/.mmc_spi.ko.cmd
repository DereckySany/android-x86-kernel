cmd_drivers/mmc/host/mmc_spi.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/mmc/host/mmc_spi.ko drivers/mmc/host/mmc_spi.o drivers/mmc/host/mmc_spi.mod.o
