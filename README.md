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
  ./$(file)
```

**File name without extention**
```bash
make file=filename
```

# Simple Function Execution
```assembly
mov dx, length
mov cx, variable
mov bx, file_descriptor
mov ax, system_call
int 0x80
```
