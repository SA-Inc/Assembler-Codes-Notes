%include 'functions.asm'

section .data
  add_message db 'addition ', 0x0
  sub_message db 'subtraction ', 0x0
  mul_message db 'multiplication ', 0x0
  div_message db 'division ', 0x0
  mod_message db 'reminder ', 0x0

section .text
global _start

_start:
  ; correctly works if first value > second value

  ; addition
  mov eax, add_message
  call print_string
  mov eax, 10
  mov ebx, 9
  ; eax = eax + ebx
  add eax, ebx
  call print_int_lf


  ; subtraction
  mov eax, sub_message
  call print_string
  mov eax, 10
  mov ebx, 9
  ; eax = eax - ebx
  sub eax, ebx
  call print_int_lf


  ; multiplication
  mov eax, mul_message
  call print_string
  mov eax, 10
  mov ebx, 9
  ; eax = eax * ebx
  mul ebx
  call print_int_lf


  ; division
  mov eax, div_message
  call print_string
  mov eax, 25
  mov ebx, 5
  ; eax = eax / ebx
  ; edx = eax % ebx (reminder)
  div ebx
  call print_int_lf
  mov eax, mod_message
  call print_string
  mov eax, edx
  call print_int_lf


  call quit
