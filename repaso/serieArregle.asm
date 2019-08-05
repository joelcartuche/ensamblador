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
	msg db 'Serie indice+valor ejm -> 1 2 4 7 11 :',10
	lenMsj equ $-msg

	msg2 db '------------------------------',10
	lenMsj2 equ $-msg2

    nueva_linea db 10, ""

    ;definimos el arreglo

    arreglo db 0,0,0,0,0
    lenArreglo equ $-arreglo



section .bss
    resultado resb 2
    auxa resb 2

    
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
	mov al,0
	
bucleI:
	mov [auxa],al
	cmp al,lenArreglo
	ja variable
	

	;mov bl,al
	;add ebx,'0'
	;mov [auxb],ebx
	;imprimirData auxb,2
	cmp al,0
	jz ingresarA

	mov bl,al;1,2
	dec bl;0,1
	mov cl,[arreglo+ebx];1,2
	inc bl;1,2

	add cl,bl;2,4
	mov [arreglo+ebx],cl;2,4

	

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

	mov al,[arreglo+ecx]
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


ingresarA:
	mov bl,1
	mov [arreglo+eax],bl
	jmp finBucleI
