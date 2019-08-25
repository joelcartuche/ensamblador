
;saltos ?
;mismo segemto -> cortos:solo un byte -128 a 127 bytes
;			   -> cercanos: 2 bytes  32768 a 32767
;cercanos y cortos -> loop
;                  -> jmp
;                  -> jnn saltos condicionales(je,eg,jb,jc)
;segemto -> call -> subrutinas 
;        ->jmp 
;	saltos a segmentos de codigo						|	-128 a 127					|	-32768 a 32767	|					|
;   registros modificados cs,ip 						|	espacio de memoria cortos	|	cercanos		|	lejanos			|
;														|	mismo segmento 				|	mismo segmento 	|	otros segmento 	|
;jmp 													|		si 						|		si 			|		si 			|	
;jnn   -> no modifican las banderas en ningun caso		|		si 						|		>80383 		|		no			|
;loop  -> por lo que no esta sujeto a ninguna banderas  |		si 						|		no			|		no			|
;call													|		si/no 					|		si			|		si 			|
;														|		short					|		near		|		far 		|

;jnnn ->cercana -128 a 127
;si bobrepasa se dea uun error de segmento fuera de rango
;jb = jc
;		transfiere el control__(ejecucion int) dependiendo 
;								-> de la configuracion de las banderas
;							intrucciones->modifican 
;								mov ax,7
;								and ax,1
;								jmp etiqueta -> bucle infinito
;								jb etiqueta -> nunca se ejecuta
;
;revisar las reglas del comparar
; comp
;	3 4 cf=1 , zf=0  jb,jl
;	4 3	cf=0 , zf=0	 jg
;   4 4 cf=0 , zf=1	 jz
;
;mov ax,11000110 -> signo dato 1-  y 0+
;mov bx,00010110
;cmp ax,bx
;¿Que banderas se alteran?
;sf,of
;registros que se modifican en saltos cortos y cercanos solo el ip
;pagina 135 todas menos 8,4 8,13 8,14 8,15
