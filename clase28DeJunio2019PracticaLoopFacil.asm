section .data
	numero db "Numero:   "
	lenNumero equ $ -numero

	salto db 10,""
	lenSalto equ $-salto



	
section .bss
	numN resb 10
	numA resb 10
	resultado resb 10

section .text
	global _start

_start:
	;inicializamos la variable para que nos de el numero de columnas
leerN:
	mov ecx,3
	
loopL1:
	push ecx
	add ecx,'0'
	mov[numero+8],dword ecx

	mov eax,4
	mov ebx,1
	mov ecx,numero
	mov edx,lenNumero
	int 80H		
	;guardamos los dato

	mov eax,4
	mov ebx,1
	mov ecx,salto 
	mov edx,lenSalto
	
	int 80H	


	pop ecx	

	loop loopL1

salir:
	mov eax, 1
	mov ebx, 0
	int 80H