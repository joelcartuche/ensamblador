
;Autor = Joel Cartuche
;Curso = 6° "B"

%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1 
	mov edx,%2
	int 80H	
%endmacro

%macro leer 2
    mov eax,3
    mov ebx,0
    mov ecx,%1 
    mov edx,%2
    int 80H 
%endmacro

; ecx,modo de acceso
; edx, permisos
section .bss
	text resb 30
	idarchivo resd 1
	text1 resb 30
	idarchivo1 resd 1

section .data
	msj1 db "Primer Dato",10
	lenMsg1 equ $- msj1

	msj2 db "Segundo Dato",10
	lenMsg2 equ $- msj2

	msg db 'la resta es: ',10
	len equ $- msg
	resta db '    '

	msgSuma db 'la suma es: ',10
	lenSuma equ $- msgSuma
	suma db '    '


	salto db '',10
	lenSalto equ $- salto

	path1 db "/home/jacc/Documentos/ensamblador/clases/dato1.txt",0 ; cero para cerrar el archivo
	path2 db "/home/jacc/Documentos/ensamblador/clases/dato2.txt",0 ; cero para cerrar el archivo

section .text
    global _start    

_start:
	;********* apertura del archivo *******************
	mov eax,5 		;servicio para abrir el archivo/ tambien id del archivo
	mov ebx,path1 	;direccion del archivo
	mov ecx,0 		;modo de acceso solo lectura
	mov edx,0 		;permisos del archivo
	int 80H 		;igual a int 80H

	test eax,eax ; es igual que el and pero solo modifica las banderas no guarda en eax
	jz salir

	;********* archivo sin exepciones ****************
	mov dword [idarchivo],eax ; respaldamos el id del archivo
	imprimir msj1 ,lenMsg1
	
	mov eax,3
	mov ebx,[idarchivo]
	mov ecx,text
	mov edx,30
	int 80H

	imprimir text,5
	imprimir salto,lenSalto
	


	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H





	;********* apertura del archivo *******************
	mov eax,5 		;servicio para abrir el archivo/ tambien id del archivo
	mov ebx,path2 	;direccion del archivo
	mov ecx,0 		;modo de acceso solo lectura
	mov edx,0 		;permisos del archivo
	int 80H 		;igual a int 80H

	test eax,eax ; es igual que el and pero solo modifica las banderas no guarda en eax
	jz salir

	;********* archivo sin exepciones ****************
	mov dword [idarchivo1],eax ; respaldamos el id del archivo
	imprimir msj2 ,lenMsg2
	
	mov eax,3
	mov ebx,[idarchivo1]
	mov ecx,text1
	mov edx,30
	int 80H

	imprimir text1,5
	imprimir salto,lenSalto


	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo1] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H


resta_Numeros:
	mov ecx , 3 ; numero de operaciones de resta
	mov esi , 2 ; posicion del digito en cada cadena
	clc ; instruccion CF en 0

ciclo_resta:
	mov al,[text + esi] ; el carril siempre se suma a la parte alta 04+1|0
	sbb al,[text1 + esi] ; suma el acarreo a resta en binario
	aas 				; ajusta la operacion binaria al sistema decimal

	
	pushf	; guarda en pila todos los valores de las banderas 
	or al,30h ;  add 48 el valor del 0 add '0'
	popf

	mov [resta +esi],al
	dec esi

	loop ciclo_resta
	imprimir msg,len
	imprimir resta,3
	imprimir salto,lenSalto


suma_numeros:
	mov ecx , 3 
	mov esi , 2 ;cuando se trabaja con operacciones extensas edx,ds,si,di o con cadenas
	clc ; instruccion CF en 0

ciclo_suma:
	mov al,[text + esi] ; el carril siempre se suma a la parte alta 04+1|07
	adc al,[text1 + esi] ;adc al,[num2 + esi] +1 mas el carril

	aaa ; ajusta al valor normal
	pushf	; guarda en pila todos los valores de las banderas 

	or al,30h ;  add 48 el valor del 0 add '0'

	popf
	mov [suma +esi],al
	dec esi

	loop ciclo_suma
	imprimir msgSuma,lenSuma
	imprimir suma,3


salir:
	mov eax, 1
	int 80H
