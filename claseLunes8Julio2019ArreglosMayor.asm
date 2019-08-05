

section .data
	msg db 'ingrese 5 numeros y presione enter',10
	lenMsj equ $-msg

    nueva_linea db 10, ""

    ;definimos el arreglo

    arreglo db 0,0,0,0,0
    lenArreglo equ $-arreglo

section .bss
    resultado resb 2
    
section .text
    global _start
    
    
_start:
	mov esi ,arreglo ;indice fuente
	mov edi,0 ; indice destino

	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,lenMsj
	int 80H			

leer:
		
	;guardamos los datos
	mov eax,3
	mov ebx,2
	mov ecx,resultado
	mov edx,2
	int 80H	

	mov al,[resultado]	
	sub al,'0'
	mov[esi],al
	inc esi
	inc edi

	cmp edi,lenArreglo ;cuando edi es menor
	jb leer
	mov ecx,0
	mov bl,0


	

comparar:
	mov al,[arreglo+ecx]
	cmp al,bl
	jb contador
	mov bl,al



contador:
	inc ecx
	cmp ecx,lenArreglo
	jb comparar

imprimir:
	add bl,'0'
	mov [resultado],bl
	mov eax,4
	mov ebx,1
	mov ecx,resultado 
	mov edx,2 
	int 80H	



salir:
	mov eax, 1
	mov ebx, 0
	int 80H




