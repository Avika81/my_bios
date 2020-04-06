cd ../seabios
# make clean
make
cd ../my_boot
as --32 -o boot.o boot.s
ld -m elf_i386 boot.o --oformat binary -o boot.bin  -Ttext 0x7c00
dd status=noxfer conv=notrunc if=boot.bin of=boot.flp

as --32 -o boot2.o boot2.s
ld -m elf_i386 boot2.o --oformat binary -o boot2.bin  -Ttext 0x7c00
dd status=noxfer conv=notrunc if=boot2.bin of=boot2.flp

qemu-system-i386 -bios ../seabios/out/bios.bin -hda boot.flp -fda boot2.flp
rm boot.o boot.flp
