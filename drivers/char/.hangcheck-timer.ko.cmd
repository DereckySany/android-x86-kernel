cmd_drivers/char/hangcheck-timer.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/char/hangcheck-timer.ko drivers/char/hangcheck-timer.o drivers/char/hangcheck-timer.mod.o
