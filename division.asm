section .data
    msg db "ingrese primer dato",10
    len equ $-msg
    
    msg1 db "ingrese segundo  dato",10
    len1 equ $-msg1
    

    resultado db "la division cosiente",10
    resultsum equ $-resultado


    resultado2 db 10,"la division residuo",10
    resultsum2 equ $-resultado2


section .bss
    nombre resb 10
    nombre1 resb 10
    resul resb 10

section .text
    global _start
    
_start:
    ;presentamos el primer mensaje
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 80H
    ;guardamos el valor
    mov eax,3
    mov ebx,2
    mov ecx,nombre
    ;mov [nombre],ecx;almacenamos el dato en nombre
    mov edx,10
    int 80H
    ;presentamo el segundo mensaje
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    int 80H
    ;guardamos el segundo dato
    mov eax,3
    mov ebx,2
    mov ecx,nombre1
    ;mov [nombre1],ecx;almacenamos el dato en el nombre1
    mov edx,10
    int 80H

    ;presentamos el tercer mensaje del resultado
    mov eax,04 
    mov ebx,01 
    mov ecx,resultado
    mov edx,resultsum
    int 80H 

    ;damos el valor a eax y ebx
    mov al,[nombre]
    mov bl,[nombre1]
    sub al,'0'
    sub bl,'0'

    ;sumamos el tercer dato
    div bl
    add al,'0' ;de int a cadena -->de cadena a int es sub
    mov [resul],al ;colocar [] para acceder al contenido de la memoria sin esto estamos modificando la direccion de memoria

    mov eax,04 ; para imprimir volvemos a asignar los valores 
    mov ebx,01 
    mov ecx,resul     
    mov edx,01
    int 80H 

    ;------------------------

    mov eax,04 
    mov ebx,01 
    mov ecx,resultado2
    mov edx,resultsum2
    int 80H 


    mov al,[nombre]
    mov bl,[nombre1]
    sub al,'0'
    sub bl,'0'

    ;sumamos el tercer dato
    div bl
    add ah,'0' ;de int a cadena -->de cadena a int es sub
    mov [resul],ah ;colocar [] para acceder al contenido de la memoria sin esto estamos modificando la direccion de memoria

    mov eax,04 ; para imprimir volvemos a asignar los valores 
    mov ebx,01 
    mov ecx,resul
    mov edx,01
    int 80H 



    mov eax,1
    int 80H

    
