cmd_drivers/platform/x86/wmi.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/platform/x86/wmi.ko drivers/platform/x86/wmi.o drivers/platform/x86/wmi.mod.o
