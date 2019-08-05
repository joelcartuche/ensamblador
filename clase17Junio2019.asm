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
    msg db "*"
    len equ $-msg
    msg1 db "*"
    len1 equ $-msg1
    

section .bss
    resultado resb 10
    

section .text
    global _start
    
_start:
	
	mov eax,2
	push eax
	
	mov eax,6
	push eax
	
	mov eax,5
	push eax
	

	pop eax
	add eax,'0'
	mov [resultado],eax
	
	mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,10
    int 80H

    pop eax
	add eax,'0'
	mov [resultado],eax
	
	mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,10
    int 80H


    pop eax
	add eax,'0'
	mov [resultado],eax
	
	mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,10
    int 80H




    jmp salida
    
salida:
    mov eax,1
    int 80H