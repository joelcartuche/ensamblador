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
	mov eax,4
	mov ebx,1
	mov ecx,numero
	mov edx,lenNumero
	int 80H					
	;guardamos los datos
	mov eax,3
	mov ebx,2
	mov ecx,numN
	mov edx,10
	int 80H		

	mov eax,4
	mov ebx,1
	mov ecx,salto 
	mov edx,lenSalto
	int 80H	

	mov al,[numN]
	sub al,'0'
	mov bl,2

	div bl
	mov al,0
	
	cmp ah,al
	jz pedirNuevo
	jmp salir

pedirNuevo:
	loop loopL1

salir:
	mov eax, 1
	mov ebx, 0
	int 80H