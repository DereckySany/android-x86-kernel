cmd_sound/core/seq/snd-seq-midi.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o sound/core/seq/snd-seq-midi.ko sound/core/seq/snd-seq-midi.o sound/core/seq/snd-seq-midi.mod.o
