cmd_drivers/rtc/rtc-ds1672.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/rtc/rtc-ds1672.ko drivers/rtc/rtc-ds1672.o drivers/rtc/rtc-ds1672.mod.o
