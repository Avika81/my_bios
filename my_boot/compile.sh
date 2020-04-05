as --32 -o boot.o boot.s
ld -m elf_i386 boot.o --oformat binary -o boot.bin  -Ttext 0x7c00
dd status=noxfer conv=notrunc if=boot.bin of=boot.flp
qemu-system-i386 boot.flp 
rm boot.o boot.flp
