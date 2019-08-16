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
	text1 resb 30
	idarchivo resd 1
	idarchivo2 resd 1
	idarchivo3 resd 1
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
	msj1 db "LEER EL ARCHIVO",10
	lenMsg1 equ $- msj1

	arreglo db 0,0,0,0,0,0
	lenArreglo equ $- arreglo

	arreglo2 db 0,0,0,0,0,0
	lenArreglo2 equ $- arreglo2


	textoGuardar db "0=0veces,0=0veces,0=0veces,0=0veces,0=0veces,0=0veces"
	lenTextoGuardar equ $-textoGuardar


	path1 db "/home/jacc/Documentos/ensamblador/clases/repaso/arreglo1.txt",0 ; cero para cerrar el archivo
	path2 db "/home/jacc/Documentos/ensamblador/clases/repaso/arreglo2.txt",0
	path3 db "/home/jacc/Documentos/ensamblador/clases/repaso/arregloMultiplicacion.txt",0 ; cero para cerrar el archivo

section .text
    global _start    

_start:
	mov al,0
	mov [contadorNum],al
	mov [indice],al
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
;	imprimir msj1 ,lenMsg1
	
	mov eax,3
	mov ebx,[idarchivo]
	mov ecx,text
	mov edx,30
	int 80H

;	imprimir text,30
	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H

;************************ llenamos el arreglo


;********* apertura del archivo *******************
	mov eax,5 		;servicio para abrir el archivo/ tambien id del archivo
	mov ebx,path2 	;direccion del archivo
	mov ecx,0 		;modo de acceso solo lectura
	mov edx,0 		;permisos del archivo
	int 80H 		;igual a int 80H

	test eax,eax ; es igual que el and pero solo modifica las banderas no guarda en eax
	jz salir

	;********* archivo sin exepciones ****************
	mov dword [idarchivo3],eax ; respaldamos el id del archivo
;	imprimir msj1 ,lenMsg1
	
	mov eax,3
	mov ebx,[idarchivo3]
	mov ecx,text1
	mov edx,30
	int 80H
;	imprimir text1,30

	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo3] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H

;************************ llenamos el arreglo

	mov esi ,arreglo ;indice fuente
	mov edi,0 ; indice destino
	mov ecx,0


leerArreglo1:
	mov al,[text+ecx]	
	sub al,'0'
	mov[esi],al
	inc esi
	inc edi
	inc ecx
	cmp edi,lenArreglo ;cuando edi es menor
	jb leerArreglo1


	mov esi ,arreglo2 ;indice fuente
	mov edi,0 ; indice destino
	mov ecx,0

leerArreglo2:
	mov al,[text1+ecx]	
	sub al,'0'
	mov[esi],al
	inc esi
	inc edi
	inc ecx
	cmp edi,lenArreglo2 ;cuando edi es menor
	jb leerArreglo2


	mov al,0

bucleI:
	mov [auxa],al
	cmp al,lenArreglo
	jz salir
	mov bl,0

;	mov bl,al
;	add ebx,'0'
;	mov [auxb],ebx
;	imprimirData auxb,2
	bucleJ:
	mov [auxb],bl
	cmp bl,lenArreglo
	jz finBucleI

	mov cl,[arreglo+eax]
	mov dl,[arreglo+ebx]

	;cmp dl,cl
	;jz ordenar ; ja para ordenar de menor a mayor y jb de mayor a menor

	;mov dl,[arreglo+eax]
	;add dl,'0'
	;mov [auxd],dl
	;imprimir auxd,2
	cmp cl,dl
	jz guardar2

	finBucleJ:
	mov bl,[auxb]
	mov al,[auxa]; recuperamos el valor de eax
	inc bl
	jmp bucleJ

	finBucleI:

	call guardarCaracter
	mov bl,0
	mov [contadorNum],bl

	mov al,[auxa]
	inc al
	jmp bucleI


salir:
	
	imprimir textoGuardar,lenTextoGuardar
	call guardarEnArchivo
	mov eax, 1
	int 80H




guardar2:
	mov [variableContada],cl

	mov dl,[contadorNum]
	inc dl
	;add dl,'0'
	;mov [contadorNum],dl

	;mov dl,[contadorNum]
	;sub dl,'0'
	mov [contadorNum],dl
	jmp finBucleJ
	
guardarCaracter:
	mov al,[variableContada]
	add al,'0'
	mov ecx,[indice]
	mov [textoGuardar+ecx],al
	add ecx,2
	mov bl,[contadorNum]
	add bl,'0'
	mov [textoGuardar+ecx],bl
	add ecx,7
	mov [indice],ecx

	ret


guardarEnArchivo:
	;********* apertura del archivo *******************
	mov eax,5 		;servicio para abrir el archivo/ tambien id del archivo
	mov ebx,path3	;direccion del archivo
	mov ecx,1	 		;modo de acceso solo lectura
	mov edx,0 		;permisos del archivo
	int 80H 		;igual a int 80H

	test eax,eax ; es igual que el and pero solo modifica las banderas no guarda en eax
	jz salir

	;********* archivo sin exepciones ****************
	mov dword [idarchivo2],eax ; respaldamos el id del archivo
;	imprimir msj1 ,lenMsg1
	
	mov eax,4
	mov ebx,[idarchivo2]
	mov ecx,textoGuardar
	mov edx,lenTextoGuardar
	int 80H

	;********* cerrar el archivo *******************
	mov eax,6		 		;servicio para abrir el archivo
	mov ebx,[idarchivo2] 	;direccion del archivo
	mov ecx,0 				;modo de acceso solo lectura
	mov edx,0 				;permisos del archivo
	int 80H 				;igual a int 80H

	ret