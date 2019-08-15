
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

section .bss
	auxiliar resb 30
	nombreIngreso resb 30
	numMenu resb 30


section .data

	msj_Menu db ' Seleccione el color a presentar:',10, '   0.Negro',10, '   1.Rojo',10, '   2.Verde',10, '   3.Amarillo',10, '   4.Azul',10, '   5.Magenta',10,  '   6.Cian',10, '   7.Salir',10, 10, ' Ingrese una opcion: '
    len_MsjMenu equ $-msj_Menu


	msgPrueba db 0x1b ,"[31m                                 " 
	lenmsgPrueba equ $-msgPrueba

	msgIngreso db "Ingrese nombre->"
	lenmsgIngreso equ $-msgIngreso




section .text
    global _start    

_start:
	imprimir msgIngreso,lenmsgIngreso 
	leer nombreIngreso,30

	mov eax,-1
	mov [auxiliar],eax


	mov ecx,lenmsgPrueba-1

	
	cicloLoop:
	push ecx
	mov eax,[auxiliar]
	inc eax
	mov [auxiliar],eax
	
	mov ebx,[nombreIngreso+eax]
	add eax,5
	mov [msgPrueba+eax],ebx



	finCiclo:
	pop ecx
	loop cicloLoop

	imprimir msj_Menu, len_MsjMenu

	leer numMenu, 2
    
    mov al, [numMenu]
    sub al, '0'
    add al, '0'
    
    mov [msgPrueba+3], al




salir:
	imprimir msgPrueba,lenmsgPrueba
	mov eax, 1
	int 80H




	


