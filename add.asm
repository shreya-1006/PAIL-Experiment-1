section .data
    msg1 db "Enter first digit: ", 0
    len1 equ $ - msg1
    msg2 db "Enter second digit: ", 0
    len2 equ $ - msg2
    msg3 db "Result: ", 0
    len3 equ $ - msg3

section .bss
    num1 resb 2     ; space for first input (1 char + newline)
    num2 resb 2     ; space for second input (1 char + newline)
    result resb 4   ; space for result string

section .text
    global _start

_start:
    ; --- Print message 1 ---
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; --- Read first number ---
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, num1
    mov edx, 2          ; read 1 digit + newline
    int 0x80

    ; --- Print message 2 ---
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; --- Read second number ---
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; --- Convert ASCII to integer ---
    mov al, [num1]
    sub al, '0'         ; convert from ASCII to int
    mov bl, [num2]
    sub bl, '0'

    ; --- Add them ---
    add al, bl

    ; --- Convert back to ASCII ---
    add al, '0'
    mov [result], al

    ; --- Print message 3 ---
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; --- Print result ---
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    ; --- Exit ---
    mov eax, 1
    xor ebx, ebx
    int 0x80

