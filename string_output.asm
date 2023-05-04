section .data
  ; ascii string and line feed termination
  string_var db 'Test string output', 0xA, 0xD
  ; $ = address of current position
  ; string_var = address of first element of "array"
  ; $ - string = length
  len equ $ - string_var

section .text
  ; programm entry point, like main function on c++
  global _start

_start:
  ; ax 4 = sys_write system call (function number)
  ; bx 1 = file descriptor stdout
  mov  eax, 4
  mov  ebx, 1
  mov  ecx, string_var
  mov  edx, len
  int  0x80

  ; ax 1 = sys_exit system call
  ; bx 0 = "zero errors", like in c++ return 0
  mov  eax, 1
  mov  ebx, 0
  int  0x80
  ; without proper exit will be "segmentation fault"
