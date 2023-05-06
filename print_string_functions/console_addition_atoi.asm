%include 'functions.asm'

section .text
  global _start

_start:
  ; 1st stack argument - number of arguments
  pop ecx
  ; 2nd stack argument - program name
  pop edx
  ; decrease arguments number, to skip program name
  sub ecx, 1
  ; sum accumulator
  mov edx, 0

next_argument:
  cmp ecx, 0x0
  jz no_arguments
  ; get from stack and convert string number to int
  pop eax
  call atoi

  ; accumulate
  add edx, eax

  dec ecx
  jmp next_argument

no_arguments:
  mov eax, edx
  call print_int_lf
  call quit
