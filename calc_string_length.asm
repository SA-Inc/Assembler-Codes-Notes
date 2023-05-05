section .data
  string_var_1 db 'Test string output', 0xA, 0x0
  string_var_2 db 'Next test string output', 0xA, 0x0

section .text
  global _start

_start:
  mov eax, string_var_1

  ; string length will be in eax
  call _get_string_length

  mov edx, eax
  mov ecx, string_var_1
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov  eax, 1
  mov  ebx, 0
  int  0x80


_get_string_length
  ; push for save previous register state
  push ebx
  ; start string address (first char)
  mov ebx, eax

_next_char:
  ; eax = will at end string address (last char)
  ; it is nessesary that string ends on 0x0
  cmp byte [eax], 0
  jz _finish
  inc eax
  jmp _next_char

_finish:
  ; calc address difference in bytes
  sub eax, ebx
  ; restore register
  pop ebx
  ret
