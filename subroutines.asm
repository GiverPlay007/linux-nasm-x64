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
  call ask_name
  call read_name
  call write_hello
  call write_name
  call exit

ask_name:
  mov rax, 1          ; sys_write
  mov rdi, 1          ; stdout
  mov rsi, ask        ; message buffer
  mov rdx, ask_len    ; message length
  syscall
  ret

read_name:
  mov rax, 0          ; sys_read
  mov rdi, 0          ; stdin
  mov rsi, name       ; buffer ptr
  mov rdx, name_len   ; input length
  syscall
  ret

write_hello:
  mov rax, 1
  mov rdi, 1
  mov rsi, hello
  mov rdx, hello_len
  syscall
  ret

write_name:
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, name_len
  syscall
  ret

exit:
  mov rax, 60  ; sys_exit
  mov rdi, 0   ; exit code
  syscall