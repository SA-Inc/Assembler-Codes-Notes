all:
  nasm -f elf32 -o $(file).o $(file).asm
  ld -m elf_i386 -o $(file) $(file).o
  rm $(file).o
  ./$(file)
