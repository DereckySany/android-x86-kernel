cmd_drivers/iio/accel/st_accel.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/iio/accel/st_accel.ko drivers/iio/accel/st_accel.o drivers/iio/accel/st_accel.mod.o
