cmd_drivers/cpufreq/p4-clockmod.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/cpufreq/p4-clockmod.ko drivers/cpufreq/p4-clockmod.o drivers/cpufreq/p4-clockmod.mod.o
