cmd_drivers/iio/humidity/dht11.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/iio/humidity/dht11.ko drivers/iio/humidity/dht11.o drivers/iio/humidity/dht11.mod.o
