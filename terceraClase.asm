section .data
	msg db "ingrese su nombre",10
	len equ $-msg
	presentar db "nombre ingresado",10
	lenp equ $-presentar
	resultado db "suma de datos 3 +5 ",10
	resultsum equ $-resultado

section .bss
	nombre resb 10
	resul resb 1

section .text
    global _start
    
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 80H
	mov eax,3
	mov ebx,2
	mov ecx,nombre
	mov edx,10
	int 80H
	mov eax,4
	mov ebx,1
	mov ecx,presentar
	mov edx,lenp
	int 80H
	mov eax,4
	mov ebx,1
	mov ecx,nombre
	mov edx,10
	int 80H

	;-------------------suma------------------
	mov eax,04 
    mov ebx,01 
    mov ecx,resultado
    mov edx,resultsum
    int 80H 

    mov eax,3
    mov ebx,5

    add eax,ebx
    add eax,'0' ;de int a cadena -->de cadena a int es sub
    mov [resul],eax ;colocar [] para acceder al contenido de la memoria sin esto estamos modificando la direccion de memoria

    mov eax,04 ; para imprimir volvemos a asignar los valores 
    mov ebx,01 
    mov ecx,resul     
    mov edx,01
    int 80H 

	mov eax,1
	int 80H



