section .data                 ; Constants
  ask db "Enter your name: "
  ask_len equ $-ask

  hello db "Hello, "
  hello_len equ $-hello

  name_len equ 10

section .bss                  ; Variables
  name resb name_len

section .text                 ; Program
global _start

_start:
  ; Write name ask
  mov eax, 1          ; sys_write
  mov edi, 1          ; stdout
  mov esi, ask        ; message buffer
  mov edx, ask_len    ; message length
  syscall

  ; Read name input
  mov eax, 0          ; sys_read
  mov edi, 0          ; stdin
  mov esi, name       ; buffer ptr
  mov edx, name_len   ; input length
  syscall

  ; Write
  mov eax, 1
  mov edi, 1
  mov esi, hello
  mov edx, hello_len
  syscall

  ; Write stored name
  mov eax, 1
  mov edi, 1
  mov esi, name
  mov edx, name_len
  syscall

  ; Exit
  mov eax, 60  ; sys_exit
  mov edi, 0   ; exit code
  syscall