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
  mov rax, 1          ; sys_write
  mov rdi, 1          ; stdout
  mov rsi, ask        ; message buffer
  mov rdx, ask_len    ; message length
  syscall

  ; Read name input
  mov rax, 0          ; sys_read
  mov rdi, 0          ; stdin
  mov rsi, name       ; buffer ptr
  mov rdx, name_len   ; input length
  syscall

  ; Write
  mov rax, 1
  mov rdi, 1
  mov rsi, hello
  mov rdx, hello_len
  syscall

  ; Write stored name
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, name_len
  syscall

  ; Exit
  mov rax, 60  ; sys_exit
  mov rdi, 0   ; exit code
  syscall
