section .data
	msjNum1 db "ingrese el primer dato:"
	lenMsjNum1 equ $-msjNum1

	msjNum2 db "ingrese el primer dato:"
	lenMsjNum2 equ $-msjNum2

	msjCrud db 'Ingrese operacion a realizar:',10,' 1.Suma',10,' 2.Resta',10,' 3.Multiplicacion',10,' 4.Division',10,'ingrese opcion: '
	lenMsjCrud equ $-msjCrud

	msjError db "error ingrese datos menores a 5",10
	lenMsjError equ $-msjError


section .bss
	datonum1 resb 10
	datonum2 resb 10
	datoCrud resb 10
	resultado resb 10
	resultres resb 10

section .text
	global _start


_start:
	jmp ingresoDatos

ingresoDatos:
	
	mov eax,4
    mov ebx,1
    mov ecx,msjNum1
    mov edx,lenMsjNum1
    int 80H		
    ;guardamos los datos
    mov eax,3
    mov ebx,2
    mov ecx,datonum1
    mov edx,10
    int 80H
    ;segundo mensaje
    mov eax,4
    mov ebx,1
    mov ecx,msjNum2
    mov edx,lenMsjNum2
    int 80H		
    ;guardamos los datos
    mov eax,3
    mov ebx,2
    mov ecx,datonum2
    mov edx,10
    int 80H


    jmp relizarSuma


comparar:

	mov eax,[datoCrud]
	mov ebx,1

	add eax,'0'
	add ebx,'0'
	
	cmp eax,ebx
	jz relizarSuma

	jmp ingresoDatos

relizarSuma:

	mov eax,[datonum1]
    mov ebx,[datonum2]
    add eax,'0'
    add ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [resultado],eax
    ;mensaje
    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,10
    int 80H	
	jmp salir
relizarResta:
	jmp salir	
relizarMul:
	jmp salir
relizarDiv:
	jmp salir		


salir:
    mov eax,1
    int 80H