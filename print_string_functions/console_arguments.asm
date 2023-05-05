%include 'functions.asm'

section .text
  global _start

; arguments on cli programm by positions on call stack
; 0 - number of arguments
; 1-n - argument strings

_start:
  ; 1st value on stack - number of passed arguments
  pop ecx

next_argument:
  ; compare args number with 0
  cmp ecx, 0x0
  ; if zero arguments, exit from loop and program
  jz no_arguments
  ; get address of argument string and print
  pop eax
  call print_string_lf
  ; decrease loop counter by 1
  dec ecx
  jmp next_argument

no_arguments:
  call quit
