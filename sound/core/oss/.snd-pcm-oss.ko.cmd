cmd_sound/core/oss/snd-pcm-oss.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o sound/core/oss/snd-pcm-oss.ko sound/core/oss/snd-pcm-oss.o sound/core/oss/snd-pcm-oss.mod.o
