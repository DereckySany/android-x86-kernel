cmd_drivers/platform/x86/thinkpad_acpi.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/platform/x86/thinkpad_acpi.ko drivers/platform/x86/thinkpad_acpi.o drivers/platform/x86/thinkpad_acpi.mod.o
