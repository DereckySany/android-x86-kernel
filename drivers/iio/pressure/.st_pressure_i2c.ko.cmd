cmd_drivers/iio/pressure/st_pressure_i2c.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/iio/pressure/st_pressure_i2c.ko drivers/iio/pressure/st_pressure_i2c.o drivers/iio/pressure/st_pressure_i2c.mod.o
