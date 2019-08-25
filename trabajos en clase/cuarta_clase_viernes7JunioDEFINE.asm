section .data
	%assign signos "+"
    mensaje db 'hola',signos,signos,signos,10
    len equ $-mensaje

section .text
	global _start
    
_start: 
	mov eax,04 
    mov ebx,01 
    mov ecx,mensaje
    mov ebx,len
    int 80H 

    mov eax, 1
    mov ebx,0
    int 80H
