cmd_drivers/iio/humidity/hdc100x.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/iio/humidity/hdc100x.ko drivers/iio/humidity/hdc100x.o drivers/iio/humidity/hdc100x.mod.o
