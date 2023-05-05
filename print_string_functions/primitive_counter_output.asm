%include 'functions.asm'

; number >= 10 will be ascii chars representations, : ; < = > etc.
; to solve this problem use itoa

section .text
  global _start

_start:
  ; counter
  mov ecx, 0

next_iteration:
  inc ecx

  ; move counter and cast to ascii
  mov eax, ecx
  add eax, 48
  ; store ascii char and point to top stack
  ; it prevents "segmentation fault"
  push eax
  mov eax, esp
  call print_string_lf

  ; restore ax
  pop eax
  cmp ecx, 10
  jne next_iteration

  call quit
