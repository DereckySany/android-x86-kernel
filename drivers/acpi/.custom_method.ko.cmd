cmd_drivers/acpi/custom_method.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/acpi/custom_method.ko drivers/acpi/custom_method.o drivers/acpi/custom_method.mod.o
