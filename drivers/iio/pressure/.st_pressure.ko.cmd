cmd_drivers/iio/pressure/st_pressure.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/iio/pressure/st_pressure.ko drivers/iio/pressure/st_pressure.o drivers/iio/pressure/st_pressure.mod.o
