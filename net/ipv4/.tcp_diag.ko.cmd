cmd_net/ipv4/tcp_diag.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o net/ipv4/tcp_diag.ko net/ipv4/tcp_diag.o net/ipv4/tcp_diag.mod.o
