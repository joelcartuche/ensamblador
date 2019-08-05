;And
;mov al,7
;and al,1
;0111
;   1  AND
;   1  NZ existe un cero
;1000
;   1
;   0 ZR
;pop eax ->sacar un dato a pila
;

;joel cartuche
section .data
    msgData db "ingrese numero de filas "
    lenData equ $-msgData
    msg db " *"
    lenmsg equ $-msg

    

section .bss
    resultado resb 2
    

section .text
    global _start
    
_start:

	mov eax,4
	mov ebx,1
	mov ecx,msgData
	mov edx,lenData
	int 80H		
	;guardamos los datos
	mov eax,3
	mov ebx,2
	mov ecx,resultado
	mov edx,10
	int 80H		
	

	mov al,[resultado]
	sub eax,'0'

	mov ecx,eax
	jmp principal

principal:
	cmp ecx,0
	jz salida
	jmp imprimir

imprimir:
	dec ecx
	push ecx

	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,lenmsg
	int 80H	

	pop ecx
    jmp principal
    
salida:
    mov eax,1
    int 80H



    ;for (i=9;i>0;i--){

    ;}