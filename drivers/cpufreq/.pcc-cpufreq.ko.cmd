cmd_drivers/cpufreq/pcc-cpufreq.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o drivers/cpufreq/pcc-cpufreq.ko drivers/cpufreq/pcc-cpufreq.o drivers/cpufreq/pcc-cpufreq.mod.o
