
;SS inicio del segmento
;SP limite
;SB desplazamiento
;
;una subrutina como el mov eax,4
;                      int 80H
;
;Nasm
;Tasm
;                          2b 2b 2b
;|__________________________________|
;						sp4 sp6 sp8  Sp10	
;
;Nas -> no necesitamos la definicion de un segmento
;
;solo variables db no de un byte
;
;se guarda invertido en el registro 015AH -> 5A01H
;pushF y popF -> guarda y reestablece la pila y el estado de las banderas
;pusha y popa -> guarda y reestablece el contenido de los registros de proposito general
;
;loops permite disminuir una cadena
;
;banderas que modifica al loop -> no existe ninguna bandera
;
;loop saltan a espacios cortos de memoria cortos cuya extencion es de 126 bytes

section .data

    nueva_linea db 10, ""
section .bss
    num resb 1
    resultado resb 1
    
section .text
    global _start
    

section .text
    global _start
    
_start:
    mov ecx,9
    mov ebx,1


;********************ciclo par imprimir enters ***********

l1:
	push ecx ; 9,8
	push ebx ; 1-desaparece,2
	call imprimir_enter
	pop ecx ;1
	push ecx ;1


;******************** ciclo para imprimir numeros por columna filas ********

l2:
	push ecx ; 1
	add ecx,'0';1
	mov [resultado],ecx;1
	call imprimir_numero
	pop ecx; 1
	loop l2 ;0
;****************** fin del ciclo l2 **************************************
	pop ebx ; 1
	inc ebx;  2
	pop ecx ; 9
	loop l1 ; 8
	jmp salir

imprimir_enter:
	mov eax,4
	mov ebx,1
	mov ecx,nueva_linea 
	mov edx,2 
	int 80H	
	ret

imprimir_numero:
	mov eax,4
	mov ebx,1
	mov ecx,resultado 
	mov edx,2 
	int 80H	
	ret

salir:
	mov eax, 1
	mov ebx, 0
	int 80H




