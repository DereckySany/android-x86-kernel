cmd_sound/usb/snd-usb-audio.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o sound/usb/snd-usb-audio.ko sound/usb/snd-usb-audio.o sound/usb/snd-usb-audio.mod.o
