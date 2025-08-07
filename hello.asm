; hello.asm
global _start

section .data:
hello: db "hello world", 10
length equ $ - hello

section .text:
_start:
    mov eax, 4        ; syscall: sys_write
    mov ebx, 1        ; file descriptor: stdout
    mov ecx, hello    ; message to write
    mov edx, length   ; message length
    int 0x80

    mov eax, 1        ; syscall: sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80

