cmd_drivers/staging/panel/panel.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/staging/panel/panel.ko drivers/staging/panel/panel.o drivers/staging/panel/panel.mod.o
