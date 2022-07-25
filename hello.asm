section .text
global _start

_start:
  mov rax, 1     ; sys_write
  mov rdi, 0     ; stdout
  mov rsi, msg   ; char buffer
  mov rdx, len   ; size
  syscall

  mov rax, 60  ; sys_exit
  mov rdi, 0   ; exit code
  syscall

section .data
msg db "Hello, World!", 0xa
len equ $-msg
