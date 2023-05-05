%include 'functions.asm'

section .data
  string_var_1 db 'Test string output', 0xA, 0x0
  string_var_2 db 'Next test string output', 0xA, 0x0

section .text
  global _start

_start:
  mov eax, string_var_1
  call print_string

  mov eax, string_var_2
  call print_string

  call quit
