%macro imprimirData 2
	mov eax,4
	mov ebx,1
	mov ecx,%1 
	mov edx,%2
	int 80H	
%endmacro

%macro leerData 2
    mov eax,3
    mov ebx,0
    mov ecx,%1 
    mov edx,%2
    int 80H 
%endmacro


section .data
	msg db 'ingrese 10 numeros y presione enter',10
	lenMsj equ $-msg

	msg2 db '------------------------------',10
	lenMsj2 equ $-msg2

    nueva_linea db 10, ""

    ;definimos el arreglo

    arreglo db 0,0,0,0,0,0,0,0,0,0
    lenArreglo equ $-arreglo

    arreglo2 db 0,0,0,0,0,0,0,0,0,0
    lenArreglo2 equ $-arreglo2



section .bss
    resultado resb 2
    auxa resb 2
    auxb resb 2
    auxc resb 2
    auxd resb 2
    auxe resb 2

    
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

	

	mov al,0
	mov bl,9


bucleI:
	mov [auxb],bl
	mov [auxa],al
	cmp bl,-1
	jz variable
	

;	mov bl,al
;	add ebx,'0'
;	mov [auxb],ebx
;	imprimirData auxb,2


	mov bl,[arreglo+ebx]

	mov [arreglo2+eax],bl

	;mov dl,[arreglo+ebx]
	;add dl,'0'
	;mov [auxd],dl
	;imprimirData auxd,2

	mov bl,[auxb]
	dec bl
	
	


	finBucleI:
	mov al,[auxa]
	inc al
	jmp bucleI


salir:
	mov eax, 1
	mov ebx, 0
	int 80H

;solo para imprimir el arreglo

variable:
imprimirData msg2,lenMsj2
mov ecx,0
jmp imprimir

imprimir:
	push ecx

	mov al,[arreglo2+ecx]
	add al,'0'
	mov [resultado],al
	
	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,2
	int 80H	

	pop ecx
	
	inc ecx

	cmp ecx,lenArreglo
	jb imprimir
	jmp salir



	
