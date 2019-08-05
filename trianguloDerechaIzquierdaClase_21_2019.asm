section .data
	msj db "*"
	lenMsj equ $ -msj
	
	salto db 10,""
	leng_salto equ $ -salto

	msjDatCol db "Ingrese valor da la matriz: "
	lengMsjDataCol equ $-msjDatCol
	
section .bss
	num resb 10

section .text
	global _start

_start:
	;inicializamos la variable para que nos de el numero de columnas
	mov ecx, 20
	mov ebx,01
	push ecx

linea1:
	push ecx
	push ebx ;ultimo entra primero en salir
	call imprimir_enter ; como usar el llamado de una funcion en condigo de alto nivel function(){}
	pop ecx
	mov ebx,ecx
	push ebx

linea2:
	push ecx
	call imprimir_asterisco
	pop ecx
	loop linea2	
	pop ebx
	pop ecx
	inc ebx
	loop linea1
	jmp salir
;*
;**
;***
;****
;*****
;******

;******
;*****
;****
;***
;**
;*

;******
; *****
;  ****
;   ***
;    **
;     *

imprimir_asterisco:
	mov eax,4
	mov ebx,1
	mov ecx,msj 
	mov edx,lenMsj 
	int 80H	
	ret

imprimir_enter:
	mov eax,4
	mov ebx,1
	mov ecx,salto 
	mov edx,1
	int 80H	
	ret

salir:
	mov eax, 1
	mov ebx, 0
	int 80H