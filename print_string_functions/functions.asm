get_string_length:
  ; push for save previous register state
  push ebx
  ; start string address (first char)
  mov ebx, eax

nextchar:
  ; eax = will at end string address (last char)
  ; it is nessesary that string ends on 0x0
  cmp byte [eax], 0
  jz finish
  inc eax
  jmp nextchar

finish:
  ; calc address difference in bytes
  sub eax, ebx
  ; restore register
  pop ebx
  ret


print_string:
  ; save register states
  push edx
  push ecx
  push ebx
  ; ax = string length
  push eax
  call get_string_length

  mov edx, eax
  ; restore start string address
  pop eax

  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  ; restore register states
  pop ebx
  pop ecx
  pop edx
  ret


print_string_lf:
  call print_string
  ; save ax state and push line feed
  push eax
  mov eax, 0Ah
  push eax
  ; move stack pointer address (points to LF symbol) and print
  mov eax, esp
  call print_string
  ; remofe line feed and restore ax
  pop eax
  pop eax
  ret


quit:
  mov ebx, 0
  mov eax, 1
  int 80h
  ret
