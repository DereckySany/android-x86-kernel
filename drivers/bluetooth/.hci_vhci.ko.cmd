cmd_drivers/bluetooth/hci_vhci.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/hci_vhci.ko drivers/bluetooth/hci_vhci.o drivers/bluetooth/hci_vhci.mod.o
