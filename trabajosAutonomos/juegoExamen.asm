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
	numMenu resb 30
	letraIngresada resb 30
	errores resb 30
	asiertos resb 30
	sonIguales resb 30
	auxiliara resb 30
	auxiliarb resb 30


section .data

; Grafico de la cabeza
	msg db 0x1b ,"[5;24f___" 
	lenmsg equ $-msg

	msg1 db 0x1b ,"[6;23f/" 
	lenmsg1 equ $-msg1

	msg2 db 0x1b ,"[6;27f\" 
	lenmsg2 equ $-msg2

	msg3 db 0x1b ,"[7;22f \" 
	lenmsg3 equ $-msg3

	msg4 db 0x1b ,"[7;27f/" 
	lenmsg4 equ $-msg4

	msg23 db 0x1b ,"[6;24fo_o" ; 6 espacios para contener al dato
	lenmsg23 equ $-msg23

	msg24 db 0x1b ,"[7;24f___" ; 6 espacios para contener al dato
	lenmsg24 equ $-msg24


;fin de grafico de la cabeza del personaje


; inicio impresion cuerpo
	
	msg6 db 0x1b ,"[8;25f|" 
	lenmsg6 equ $-msg6

	msg7 db 0x1b ,"[9;25f|" 
	lenmsg7 equ $-msg7

	msg8 db 0x1b ,"[10;25f|" ; 6 espacios para contener al dato
	lenmsg8 equ $-msg8

	msg9 db 0x1b ,"[11;25f|" ; 6 espacios para contener al dato
	lenmsg9 equ $-msg9

	msg10 db 0x1b ,"[12;25f|" ; 6 espacios para contener al dato
	lenmsg10 equ $-msg10

;fin impresion cuerpo



;impresion brazo derecho;
	msg11 db 0x1b ,"[10;26f\" ; 6 espacios para contener al dato
	lenmsg11 equ $-msg11

	msg12 db 0x1b ,"[11;27f\" ; 6 espacios para contener al dato
	lenmsg12 equ $-msg12

	msg13 db 0x1b ,"[12;28f\" ; 6 espacios para contener al dato
	lenmsg13 equ $-msg13

	
;fin impresion brazo derecho


;inicio impresion brazo izquierdo
	msg14 db 0x1b ,"[10;24f/" ; 6 espacios para contener al dato
	lenmsg14 equ $-msg14

	msg15 db 0x1b ,"[11;23f/" ; 6 espacios para contener al dato
	lenmsg15 equ $-msg15

	msg16 db 0x1b ,"[12;22f/" ; 6 espacios para contener al dato
	lenmsg16 equ $-msg16
;fin impresion brazo izquierdo


;impresion pie derecho;

	msg17 db 0x1b ,"[13;26f\" ; 6 espacios para contener al dato
	lenmsg17 equ $-msg17

	msg18 db 0x1b ,"[14;27f\" ; 6 espacios para contener al dato
	lenmsg18 equ $-msg18

	msg19 db 0x1b ,"[15;28f\" ; 6 espacios para contener al dato
	lenmsg19 equ $-msg19
;fin de impresion pie derecho

;impresion pie izquierdo

	msg20 db 0x1b ,"[13;24f/" ; 6 espacios para contener al dato
	lenmsg20 equ $-msg20

	msg21 db 0x1b ,"[14;23f/" ; 6 espacios para contener al dato
	lenmsg21 equ $-msg21

	msg22 db 0x1b ,"[15;22f/" ; 6 espacios para contener al dato
	lenmsg22 equ $-msg22

;fin de impresion pie izquierdo

	
;inicio  impresionCuerda
	msg25 db 0x1b ,"[4;23f__|__" 
	lenmsg25 equ $-msg25
	msg5 db 0x1b ,"[5;28f\" 
	lenmsg5 equ $-msg5
	msg26 db 0x1b ,"[6;29f\" 
	lenmsg26 equ $-msg26

	msg27 db 0x1b ,"[7;29f/" ; 6 espacios para contener al dato
	lenmsg27 equ $-msg27

	msg28 db 0x1b ,"[8;28f/" ; 6 espacios para contener al dato
	lenmsg28 equ $-msg28


	msg29 db 0x1b ,"[5;22f/" ; 6 espacios para contener al dato
	lenmsg29 equ $-msg29

	msg30 db 0x1b ,"[6;21f/" ; 6 espacios para contener al dato
	lenmsg30 equ $-msg30

	msg31 db 0x1b ,"[7;21f\" ; 6 espacios para contener al dato
	lenmsg31 equ $-msg31

	msg32 db 0x1b ,"[8;22f\" ; 6 espacios para contener al dato
	lenmsg32 equ $-msg32

	msg33 db 0x1b ,"[8;23f_____" ; 6 espacios para contener al dato
	lenmsg33 equ $-msg33

	msg34 db 0x1b ,"[3;25f|" ; 6 espacios para contener al dato
	lenmsg34 equ $-msg34

;fin impresion Cuerda


;inicio impresion soporte;
	msg35 db 0x1b ,"[2;10f _______________" 
	lenmsg35 equ $-msg35

	msg36 db 0x1b ,"[3;10f|" 
	lenmsg36 equ $-msg36

	msg37 db 0x1b ,"[4;10f|" 
	lenmsg37 equ $-msg37

	msg38 db 0x1b ,"[5;10f|"
	lenmsg38 equ $-msg38

	msg39 db 0x1b ,"[6;10f|"
	lenmsg39 equ $-msg39

	msg40 db 0x1b ,"[7;10f|"
	lenmsg40 equ $-msg40

	msg41 db 0x1b ,"[8;10f|"
	lenmsg41 equ $-msg41

	msg42 db 0x1b ,"[9;10f|"
	lenmsg42 equ $-msg42

	msg43 db 0x1b ,"[10;10f|"
	lenmsg43 equ $-msg43


	msg44 db 0x1b ,"[11;10f|"
	lenmsg44 equ $-msg44


	msg45 db 0x1b ,"[12;10f|"
	lenmsg45 equ $-msg45


	msg46 db 0x1b ,"[13;10f|"
	lenmsg46 equ $-msg46


	msg47 db 0x1b ,"[14;10f|"
	lenmsg47 equ $-msg47


	msg48 db 0x1b ,"[15;10f|"
	lenmsg48 equ $-msg48


	msg49  db 0x1b ,"[16;10f|"
	lenmsg49 equ $-msg49 


	msg50 db 0x1b ,"[17;7f___|___"
	lenmsg50 equ $-msg50

;fin impresion soporte

;inicio mensajes del juego
	msgMenu db 0x1b ,"[1;1f","seleccione dificultad: ",10,"1. Jugar",10,"2. Salir",10,"Ingrese opcion-> "
	lenMenu equ $-msgMenu

	limpiarPantalla db 10,0x1b,"[2J"
	lenLimpiar equ $-limpiarPantalla



	palabraIngresada db 0x1b ,"[20;1f Ingrese letra-> "
	lenpalabraIngresada equ $-palabraIngresada

	
	borrarLetra db 0x1b,"[20;13f         "
	lenBorrarLetra equ $-borrarLetra

	palabraJuego db 0x1b ,"[18;1fP--C--S-----"
	lenPalabraJuego equ $-palabraJuego

	pista db 0x1b ,"[19;1f Pista: Aplazar"
	lenPista equ $-pista

	palabraAdivinar db 0x1b ,"      PROCRASTINAR"
	lenPalabra equ $-palabraAdivinar



	mensajeSalida db 0x1b ,"[22;1f FIN DEL JUEGO!!",10, "Presione enter para cerrar la consola...."
	lenMensajesSalida equ $-mensajeSalida

	
	espacio db 0x1b ,"[20;1f ->"
	lenEspacio equ $-espacio


section .text
    global _start    

_start:

imprirMenu:

	mov al,0
	mov [asiertos],al
	mov [errores],al
	mov al,5
	mov [auxiliara],al
	imprimir msgMenu,lenMenu
	leer numMenu,30

	;mov eax,[numMenu+4]
	;mov [prueba2+5],eax
	;imprimir prueba2,lenPrueba2

	;jmp salir

	mov al,[numMenu]
	sub al,'0'
	cmp al,1
	jz InicioJuego
	cmp al,2
	jz salir



salir:
	imprimir  mensajeSalida,lenMensajesSalida
	mov eax, 1
	int 80H


InicioJuego:
	imprimir limpiarPantalla,lenLimpiar
	imprimir pista,lenPista
	imprimir palabraJuego,lenPalabraJuego

	jmp imprimirMensajes

compararLetra:
	push ecx


	mov al,[letraIngresada]
	mov bl,[palabraAdivinar+ecx]
	cmp al,bl
	jz imprimirCorrecto


	regreso:
	pop ecx
	cmp ecx,0
	jz imprimirMensajes


	dec ecx

	jmp compararLetra



imprimirCorrecto:
	mov al,[letraIngresada]
	mov [palabraJuego+ecx],al
	imprimir palabraJuego,lenPalabraJuego
	mov al,[asiertos]
	inc al
	cmp al,9
	jz salir
	mov [asiertos],al

	mov bl,2
	mov [auxiliara],bl

	jmp regreso

imprimirErroneos:
	mov al,[errores]
	inc al
	mov [errores],al
	mov bl,0
	mov [auxiliara],bl
	cmp al,1
	jz impresionSoporte
	cmp al,2
	jz impresionCuerda
	cmp al,3
	jz imprimirCabeza
	cmp al,4
	jz impresionCuerpo
	cmp al,5
	jz impresionBrazoDerecho
	cmp al,6
	jz impresionBrazoIzquierdo
	cmp al,7
	jz impresionPieDerecho
	cmp al,8
	jz impresionPieIquierdo


	jmp salir


imprimirMensajes:
	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada

	mov al,[auxiliara]
	cmp al,1
	jz imprimirErroneos

	leer letraIngresada,4

	finImpresionMensaje:

	mov al,1
	mov [auxiliara],al

	mov ecx,lenPalabra-1

	jmp compararLetra

imprimirCabeza:

	imprimir msg,lenmsg
	imprimir msg1,lenmsg1
	imprimir msg2,lenmsg2
	imprimir msg3,lenmsg3
	imprimir msg4,lenmsg4
	imprimir msg23,lenmsg23
	imprimir msg24,lenmsg24
	
	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4
	jmp finImpresionMensaje



impresionCuerpo:
	imprimir msg6,lenmsg6
	imprimir msg7,lenmsg7
	imprimir msg8,lenmsg8
	imprimir msg9,lenmsg9
	imprimir msg10,lenmsg10

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4
	
	jmp finImpresionMensaje


impresionBrazoDerecho:
	imprimir msg11,lenmsg11
	imprimir msg12,lenmsg12
	imprimir msg13,lenmsg13

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4

	jmp finImpresionMensaje

impresionBrazoIzquierdo:
	imprimir msg14,lenmsg14
	imprimir msg15,lenmsg15
	imprimir msg16,lenmsg16

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4

	jmp finImpresionMensaje

impresionPieDerecho:
	imprimir msg17,lenmsg17
	imprimir msg18,lenmsg18
	imprimir msg19,lenmsg19

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4

	jmp finImpresionMensaje

impresionPieIquierdo:
	imprimir msg20,lenmsg20
	imprimir msg21,lenmsg21
	imprimir msg22,lenmsg22

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4

	jmp finImpresionMensaje

impresionCuerda:
	imprimir msg5,lenmsg5
	imprimir msg25,lenmsg25
	imprimir msg26,lenmsg26
	imprimir msg27,lenmsg27
	imprimir msg28,lenmsg28
	imprimir msg29,lenmsg29
	imprimir msg30,lenmsg30
	imprimir msg31,lenmsg31
	imprimir msg32,lenmsg32
	imprimir msg33,lenmsg33
	imprimir msg34,lenmsg34

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4

	jmp finImpresionMensaje

impresionSoporte:
	imprimir msg35,lenmsg35
	imprimir msg36,lenmsg36
	imprimir msg37,lenmsg37
	imprimir msg38,lenmsg38
	imprimir msg39,lenmsg39
	imprimir msg40,lenmsg40
	imprimir msg41,lenmsg41
	imprimir msg42,lenmsg42
	imprimir msg43,lenmsg43
	imprimir msg44,lenmsg44
	imprimir msg45,lenmsg45
	imprimir msg46,lenmsg46
	imprimir msg47,lenmsg47
	imprimir msg48,lenmsg48
	imprimir msg49,lenmsg49
	imprimir msg50,lenmsg50

	imprimir borrarLetra,lenBorrarLetra
	imprimir palabraIngresada,lenpalabraIngresada
		
	leer letraIngresada,4

	jmp finImpresionMensaje
	




	



