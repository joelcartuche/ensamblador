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
	msg db 'ingrese 5 numeros y presione enter',10
	lenMsj equ $-msg

	msg2 db '------------------------------',10
	lenMsj2 equ $-msg2

    nueva_linea db 10, ""
    lenLinea equ $-nueva_linea

    ;definimos el arreglo

    arreglo db 0,0,0,0,0
    lenArreglo equ $-arreglo



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

	imprimirData msg2,lenMsj2

	mov al,0

bucleI:
	mov [auxa],al
	cmp al,lenArreglo
	jz variablePar
	mov bl,0

;	mov bl,al
;	add ebx,'0'
;	mov [auxb],ebx
;	imprimirData auxb,2
	bucleJ:
	mov [auxb],bl
	cmp bl,lenArreglo
	jz finBucleI

	mov cl,[arreglo+eax]
	mov dl,[arreglo+ebx]

	cmp dl,cl
	jz ordenar ; ja para ordenar de menor a mayor y jb de mayor a menor

	;mov dl,[arreglo+eax]
	;add dl,'0'
	;mov [auxd],dl
	;imprimirData auxd,2

	
	finBucleJ:
	mov bl,[auxb]
	mov al,[auxa]; recuperamos el valor de eax
	inc bl
	jmp bucleJ


	finBucleI:
	mov al,[auxa]
	inc al
	jmp bucleI


salir:
	mov eax, 1
	mov ebx, 0
	int 80H

;solo para imprimir el arreglo


ordenar:
	mov dl,0
	mov [arreglo+eax],dl
	mov [arreglo+ebx],cl
	jmp finBucleJ


	
variablePar:
 mov al,0

bucleIPar:
	mov [auxa],al

	cmp al,lenArreglo
	jz salir
	
	mov dl,al
	mov bl,2
	mov al, [arreglo+eax]	



	div bl

	cmp ah,1
	jz imprimir

	finBucleIPar:
	mov al,[auxa]
	inc al
	jmp bucleIPar



;solo para imprimir el arreglo



imprimir:
	
	mov al,[arreglo+edx]

	div bl
	cmp ah,1
	jz imprimir2

	jmp finBucleIPar

imprimir2:

	mov al,[arreglo+edx]

	cmp al,0
	jne imprimir3

	jmp finBucleIPar

imprimir3:
	add al,'0'
	mov [auxb],al
	imprimirData auxb,2
	imprimirData nueva_linea,lenLinea
	jmp finBucleIPar



