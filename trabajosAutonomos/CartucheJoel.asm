
;Joel CArtuche
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
	cont resb 10
	aux resb 10
	auxA resb 10
	auxB resb 10
	resultado resb 10

section .text
	global _start

_start:
	;inicializamos la variable para que nos de el numero de columnas
	; 6/2 = 3  1 6-2=4  2 5-2=3 
	; 6/3 = 2   6-3=3 5-3=2 4-3=1e
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

	mov al,0
	mov [cont],al
	mov al,0
	mov [auxA],al

	mov al,[numN]	
	mov bl,[numA]
	mov cl,[cont]
	mov dl,[numN]

	sub al,'0'
	sub bl,'0'
	sub dl,'0'

operacion:

	cmp al,bl
	jg operacion1
	jz imprimirResultado
	jmp salir
	
operacion1:
	sub al,bl

	mov [aux],al
	mov [auxB],bl

	mov al,[aux]
	mov bl,[auxA]

	add al,bl
	mov [auxA],al

	cmp al,dl
	jz imprimirResultado

	
	mov bl,[auxB]
	mov al,[aux]
	mov cl,[cont]
	
	inc cl

	jmp operacion1
	



imprimirResultado:

	add cl,'0'
	mov [resultado],cl

	mov eax,4
	mov ebx,1
	mov ecx,resultado 
	mov edx, 3
	int 80H	
	jmp salir

	


	

salir:
	mov eax, 1
	mov ebx, 0
	int 80H