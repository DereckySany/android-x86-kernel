cmd_drivers/iio/pressure/bmp280.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/iio/pressure/bmp280.ko drivers/iio/pressure/bmp280.o drivers/iio/pressure/bmp280.mod.o
