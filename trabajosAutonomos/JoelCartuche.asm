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
		idarchivo2 resd 1
	resultado resb 10
	auxa resb 10
	auxb resb 10 
	auxd resb 10 

	contadorNum resb 10
	contadorNum2 resb 10
	variableContada resb 10
	indice resb 10
	auxiliar resb 1


section .data
	
	
	msj2 db "Ingrese un numero",10
	lenMsg2 equ $- msj2

	

	msj1 db "LEER EL ARCHIVO",10
	lenMsg1 equ $- msj1

	arreglo db 0,0,0,0,0,0,0,0,0,0
	lenArreglo equ $- arreglo


	textoGuardar db "0=0veces"
	lenTextoGuardar equ $-textoGuardar


	path db "/home/jacc/Documentos/ensamblador/clases/arreglo.txt",0 ; cero para cerrar el archivo
	path2 db "/home/jacc/Documentos/ensamblador/clases/repeticiones.txt",0

section .text
    global _start    

_start:
	imprimir msj2,lenMsg2

	leer auxiliar,2

	mov al,[auxiliar]

	sub al,'0'
	mov [auxiliar],al

	mov al,0
	mov [contadorNum],al
	mov [indice],al
;********* apertura del archivo *******************
	mov eax,5 		;servicio para abrir el archivo/ tambien id del archivo
	mov ebx,path 	;direccion del archivo
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

	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H

;************************ llenamos el arreglo

	mov esi ,arreglo ;indice fuente
	mov edi,0 ; indice destino


	mov ecx,0


leerArreglo:
	mov al,[text+ecx]	
	sub al,'0'
	mov[esi],al
	inc esi
	inc edi
	inc ecx
	cmp edi,lenArreglo ;cuando edi es menor
	jb leerArreglo
	mov ecx,0


	mov al,0
	
bucleI:
	mov [auxa],al
	cmp al,lenArreglo
	jz salir

	mov al,[arreglo+eax]
	mov bl,[auxiliar]
	cmp al,bl
	jz guardar

	finBucleI:

	mov al,[auxa]
	inc al
	jmp bucleI


salir:
	mov al,[variableContada]
	add al,'0'
	mov [textoGuardar+0],al
	mov al,[contadorNum]
	add al,'0'
	mov [textoGuardar+2],al

	
	imprimir textoGuardar,lenTextoGuardar

	call guardarEnArchivo
	mov eax, 1
	int 80H


guardar:
	mov [variableContada],bl

	mov bl,[contadorNum]
	inc bl

	mov [contadorNum],bl

	jmp finBucleI
	



guardarEnArchivo:
	;********* apertura del archivo *******************
	mov eax,5 		;servicio para abrir el archivo/ tambien id del archivo
	mov ebx,path2 	;direccion del archivo
	mov ecx,1	 		;modo de acceso solo lectura
	mov edx,0 		;permisos del archivo
	int 80H 		;igual a int 80H

	test eax,eax ; es igual que el and pero solo modifica las banderas no guarda en eax
	jz salir

	;********* archivo sin exepciones ****************
	mov dword [idarchivo2],eax ; respaldamos el id del archivo
	
	mov eax,4
	mov ebx,[idarchivo2]
	mov ecx,textoGuardar
	mov edx,lenTextoGuardar
	int 80H

	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H

	ret