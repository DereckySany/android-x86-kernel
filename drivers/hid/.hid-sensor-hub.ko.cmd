cmd_drivers/hid/hid-sensor-hub.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-sensor-hub.ko drivers/hid/hid-sensor-hub.o drivers/hid/hid-sensor-hub.mod.o
