section .data
  string_var_1 db 'Test string output', 0xA, 0xD
  string_len_1 equ $ - string_var_1
  string_var_2 db 'Next test string output', 0xA, 0xD
  string_len_2 equ $ - string_var_2

section .text
  global _start

_start:
  ; skip first string and jump to label
  jmp _next_string

  mov  eax, 4
  mov  ebx, 1
  mov  ecx, string_var_1
  mov  edx, string_len_1
  int  0x80

_next_string
  mov  eax, 4
  mov  ebx, 1
  mov  ecx, string_var_2
  mov  edx, string_len_2
  int  0x80

  mov  eax, 1
  mov  ebx, 0
  int  0x80
