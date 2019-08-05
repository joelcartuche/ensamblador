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

section .data
	msg db 'la resta es: ',10
	len equ $- msg
	num1 db '518'
	num2 db '197'
	resta db '   '

section .text
	global _start

_start:
	mov ecx , 3 ; numero de operaciones de resta
	mov esi , 2 ; posicion del digito en cada cadena
	clc ; instruccion CF en 0

ciclo_resta:
	mov al,[num1 + esi] ; el carril siempre se suma a la parte alta 04+1|0
	sbb al,[num2 + esi] ; suma el acarreo a resta en binario
	aas 				; ajusta la operacion binaria al sistema decimal

	
	pushf	; guarda en pila todos los valores de las banderas 
	or al,30h ;  add 48 el valor del 0 add '0'
	popf

	mov [resta +esi],al
	dec esi

	loop ciclo_resta
	imprimir msg,len
	imprimir resta,3


salir:
	mov eax,1
	int 80H
