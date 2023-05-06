%include 'functions.asm'

section .text
  global _start

_start:
  ; counter
  mov ecx, 0

next_iteration:
  inc ecx

  mov eax, ecx
  call print_int_lf
  cmp ecx, 10
  jne next_iteration

  call quit
