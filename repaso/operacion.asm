section .data
	msjN db "Ingrese valor n"
	lenMsjN equ $ -msjN

	msjA db "Ingrese valor a"
	lenMsjA equ $ -msjA
	
	salto db 10,""
	leng_salto equ $ -salto


	
section .bss
	numN resb 10
	numA resb 10
	resultado resb 10

section .text
	global _start

;******
; *****
;  ****
;   ***
;    **
;     *

_start:
	;inicializamos la variable para que nos de el numero de columnas
leerN:
	mov eax,4
	mov ebx,1
	mov ecx,msjN
	mov edx,lenMsjN
	int 80H		
	;guardamos los datos
	mov eax,3
	mov ebx,2
	mov ecx,numN
	mov edx,10
	int 80H		

leerA:
	mov eax,4
	mov ebx,1
	mov ecx,msjA
	mov edx,lenMsjA
	int 80H		
	;guardamos los datos
	mov eax,3
	mov ebx,2
	mov ecx,numA
	mov edx,10
	int 80H	

operacion:
	
	mov eax,[numN]	
	mov ebx,[numA]
	sub eax,'0'
	sub ebx,'0'

	add eax,ebx
	mov ebx,[numN]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov [resultado],eax

imprimirResultado:
	mov eax,4
	mov ebx,1
	mov ecx,resultado 
	mov edx,10 
	int 80H	



salir:
	mov eax, 1
	mov ebx, 0
	int 80H