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
	msg db 'la suma es: ',10
	len equ $- msg 
	num1 db '518'
	num2 db '195'
	suma db '   '


section .text
	global _start

_start:
	mov ecx , 3 
	mov esi , 2 ;cuando se trabaja con operacciones extensas edx,ds,si,di o con cadenas
	clc ; instruccion CF en 0

ciclo_suma:
	mov al,[num1 + esi] ; el carril siempre se suma a la parte alta 04+1|07
	adc al,[num2 + esi] ;adc al,[num2 + esi] +1 mas el carril

	aaa ; ajusta al valor normal
	pushf	; guarda en pila todos los valores de las banderas 

	or al,30h ;  add 48 el valor del 0 add '0'

	popf
	mov [suma +esi],al
	dec esi

	loop ciclo_suma
	imprimir msg,len
	imprimir suma,3


salir:
	mov eax,1
	int 80H
