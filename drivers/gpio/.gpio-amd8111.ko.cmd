cmd_drivers/gpio/gpio-amd8111.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/gpio/gpio-amd8111.ko drivers/gpio/gpio-amd8111.o drivers/gpio/gpio-amd8111.mod.o
