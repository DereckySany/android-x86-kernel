cmd_sound/pci/hda/snd-hda-codec.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o sound/pci/hda/snd-hda-codec.ko sound/pci/hda/snd-hda-codec.o sound/pci/hda/snd-hda-codec.mod.o
