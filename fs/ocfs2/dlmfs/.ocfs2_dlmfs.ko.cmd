cmd_fs/ocfs2/dlmfs/ocfs2_dlmfs.ko := ld -r -m elf_x86_64 -T ./scripts/module-common.lds --build-id  -o fs/ocfs2/dlmfs/ocfs2_dlmfs.ko fs/ocfs2/dlmfs/ocfs2_dlmfs.o fs/ocfs2/dlmfs/ocfs2_dlmfs.mod.o
