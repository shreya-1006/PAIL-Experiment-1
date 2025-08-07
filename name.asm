section .data
    name db 'shreya', 0xA
    namelen equ $ - name
    surname db 'chavan', 0xA
    surnamelen equ $ - surname

section .text
    global _start

_start:
    ; Print first name
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, namelen
    int 0x80

    ; Print surname
    mov eax, 4
    mov ebx, 1
    mov ecx, surname
    mov edx, surnamelen
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
