%include 'functions.asm'

section .bss
  ; reserved memory space
  var1: resb 255

section .text
  global _start

_start:
  ; number bytes to reas
  mov edx, 255
  ; address to variable
  mov ecx, var1
  ; bx 0 = file descriptor stdin
  ; ax 3 = sys_read system call (function number)
  mov ebx, 0
  mov eax, 3
  int 80h

  mov eax, var1
  call print_string_lf

  call quit
