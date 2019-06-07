section .data
	;directivas dword 
	;byte 1b
	;word 2b
	;dword 4-> a usar
	;quaword 8
	;tword 10
	;dword permite cambiar el valor original de una constante
	;mensaje db "hola clase" 
	;cambiar el mensaje con dword
	;permite hacer desplazamientos a nivel de memoria 
	;mov[mensaje+0],H -> desplazamiento en mesaje ubicandolo en la primera posicion
	mensaje db "hola mundo" ,0xa
	len equ $-mensaje

section .text
	global _start
    
_start: 
	mov eax,04 
    mov ebx,01 
    mov ecx,mensaje
    mov edx,len
    int 80H 

    mov[mensaje],dword 'mala'
    ;mov[mensaje+0],dword 'mala' es lo mismo q la linea anterior

    mov eax,04 
    mov ebx,01 
    mov ecx,mensaje
    mov edx,len
    int 80H 

    mov[mensaje+5],dword 'niña' ;los caracteres especiales ocupan dos bits
    ;mov[mensaje+0],dword 'mala' es lo mismo q la linea anterior

    mov eax,04 
    mov ebx,01 
    mov ecx,mensaje
    mov edx,len
    int 80H 

    mov eax, 1
    mov ebx,0
    int 80H
