print_int:
  push eax
  push ecx
  push edx
  push esi
  ; byte counter (how many we should print)
  mov ecx, 0

divide_loop:
  ; inc chars number
  inc ecx
  mov edx, 0
  mov esi, 10
  ; divide ax by si (in dx will be reminder)
  idiv esi
  ; cast to ascii
  add edx, 48
  ; push string representation on int
  push edx
  ; check can out int number be divided
  cmp eax, 0
  jnz divide_loop

print_loop:
  ; how many string ints in stack
  dec ecx
  ; print char
  mov eax, esp
  call print_string
  ; remove last char
  pop eax
  cmp ecx, 0
  jnz print_loop

  pop esi
  pop edx
  pop ecx
  pop eax
  ret


print_int_lf:
  call print_int
  ; save ax state
  push eax
  ; push line feed char and get address
  mov eax, 0xA
  push eax
  mov eax, esp
  ; print lf char
  call print_string
  ; remove lf
  pop eax
  ; restore ax state
  pop eax
  ret


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
