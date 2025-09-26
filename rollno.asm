section .bss
    name resb 50         
    roll_no resb 10      
    address resb 100     

section .text
    global _start

_start:
    ; Prompt for Name
    mov eax, 4          
    mov ebx, 1          
    mov ecx, print_name
    mov edx, print_name_len
    int 0x80

    mov eax, 3          
    mov ebx, 0          
    mov ecx, name       
    mov edx, 50         
    int 0x80

    ; Prompt for Roll Number
    mov eax, 4
    mov ebx, 1
    mov ecx, print_roll_no
    mov edx, print_roll_no_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, roll_no
    mov edx, 10
    int 0x80

    ; Prompt for Address
    mov eax, 4
    mov ebx, 1
    mov ecx, print_address
    mov edx, print_address_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, address
    mov edx, 100
    int 0x80

    ; Exit the program
    mov eax, 1          
    xor ebx, ebx        
    int 0x80

section .data
    print_name db 'Enter your name: ', 0
    print_name_len equ $ - print_name

    print_roll_no db 'Enter your roll number: ', 0
    print_roll_no_len equ $ - print_roll_no

    print_address db 'Enter your address: ', 0
    print_address_len equ $ - print_address
