cmd_drivers/bluetooth/hci_uart.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/hci_uart.ko drivers/bluetooth/hci_uart.o drivers/bluetooth/hci_uart.mod.o
