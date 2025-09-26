section .data
    msg1 db "Enter first digit: ",0
    len1 equ $-msg1
    msg2 db "Enter second digit: ",0
    len2 equ $-msg2
    msg3 db "Product: ",0
    len3 equ $-msg3

section .bss
    num1 resb 2
    num2 resb 2
    result resb 1

section .text
    global _start

_start:
    ; Input first number
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num1
    mov edx,2
    int 0x80

    ; Input second number
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx,2
    int 0x80

    ; Convert ASCII
    mov al,[num1]
    sub al,'0'
    mov bl,[num2]
    sub bl,'0'

    ; Multiply
    mul bl
    add al,'0'
    mov [result],al

    ; Print result
    mov eax,4
    mov ebx,1
    mov ecx,msg3
    mov edx,len3
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,result
    mov edx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80

