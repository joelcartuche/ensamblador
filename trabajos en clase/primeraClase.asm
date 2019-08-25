section .data
     saludo db 'lenguaje ensamblador',0xa;como un arreglo el 0xa en este caso enter
     saludo1 db 'sexto cicloB',0xa
     saludo2 db 'joel cartuche',0xa
     len EQU $-saludo ;calcular el tamaño de el string saludo
     len1 EQU $-saludo1 ;calcular el tamaño de el string saludo
     len2 EQU $-saludo2 ;calcular el tamaño de el string saludo
     
section .text
	global _start
    
_start: 
    mov eax,04 ;ax define el tipo de operacion de escritura
    mov ebx,01 ;bx define la unidad estandar verificar la salida
    mov ecx,saludo ;cx se almacena la referencia de la constante saludo para imprimir
    mov edx,len ; dx define el # caracteres que se va a imprimir
    int 80H ;lo que hace es verificar los 4 registros que valor tiene eax el ultimo
    
    ;violacion de segmento porq tiene que volver 
    
    ;el ultimo de ebx
    ;el ultimo de ecx
    ;el ultimo de edx
    
    mov eax, 1
    mov ebx, 0
    int 80H
    
    mov ecx, saludo1
    mov edx, len1
    int 80H
    mov eax, 1
    mov ebx, 0
    int 80H
    
    mov ecx, saludo2
    mov edx, len2
    int 80H
    mov eax, 1
    mov ebx, 0
    int 80H










