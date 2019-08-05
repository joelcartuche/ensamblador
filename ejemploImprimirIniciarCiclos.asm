%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1 
	mov edx,%2
	int 80H	
%endmacro
section .data
	msj1 db "inicio ciclos",10,"realizado por:",10
	lenMsg1 equ $- msj1
	msj2 db "joel",10
	lenMsg2 equ $-msj2
	msj3 db "fin de ciclo",10
	lenMsg3 equ $-msj3
section .text
    global _start    
_start:
	imprimir msj1,lenMsg1
    mov ecx,9
linea1:
	push ecx
	imprimir msj2,lenMsg2
	pop ecx
	loop linea1
linea2:
	imprimir msj3,lenMsg3
salir:
	mov eax, 1
	int 80H














