global _start

section .data
	name db"Name:Gaurav",10
	name_len equ $-name
	
	surname db"Surname:Gaikwad",10
	surname_len equ $-surname
	
section .text
	%macro print 2
		mov eax,4
		mov ebx,1
		mov ecx,%1
		mov edx,%2
		int 80h
	%endmacro
	
	_start:
		print name,name_len
		print surname,surname_len
		
		;exit system call
		mov eax,1
		xor ebx,ebx
		int 80h
