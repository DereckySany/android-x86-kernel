cmd_drivers/usb/phy/phy-generic.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/usb/phy/phy-generic.ko drivers/usb/phy/phy-generic.o drivers/usb/phy/phy-generic.mod.o
