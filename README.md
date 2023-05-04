# Assembler Codes Notes
Assembler Codes and Notes on NASM

- x86_64
- Linux
- NASM

# Make File for compiling, linking and executing
```makefile
all:
  nasm -f elf32 -o $(file).o $(file).asm
  ld -m elf_i386 -o $(file) $(file).o
  rm $(file).o
```

```bash
make file=filename
```
