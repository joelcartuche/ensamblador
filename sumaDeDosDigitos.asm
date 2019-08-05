;joel cartuche
section .data
    msg db "ingrese primer dato",10
    len equ $-msg
    
    msg1 db "ingrese segundo  dato",10
    len1 equ $-msg1
    

    resultado db 10,"Resultado ****",10
    resultsum equ $-resultado

    msjCrud db 'Ingrese operacion a realizar:',10,' 1.Suma',10,' 2.Resta',10,' 3.Multiplicacion',10,' 4.Division',10,' 5.salir',10,'ingrese opcion: '
    lenMsjCrud equ $-msjCrud

    msjError db "error ingrese datos menores a 5",10
    lenMsjError equ $-msjError

section .bss
    datoNum1 resb 10
    datoNum2 resb 10
    datoCrud resb 10 
    resul resb 10
    resulr resb 10

section .text
    global _start
    
_start:
    jmp ingresoDatosOperacion
;mostramos los mensajes del crud y se ingresa la opcion

ingresoDatosOperacion:
    ;presentamos el primer mensaje
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 80H
    ;guardamos el valor
    mov eax,3
    mov ebx,2
    mov ecx,datoNum1
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
    mov ecx,datoNum2
    mov edx,10
    int 80H

    jmp realizarSuma

;comparamos el numero ingresado del crud

realizarSuma:
    mov[resultado+11],dword 'sum'
    
    mov eax,04 
    mov ebx,01 
    mov ecx,resultado
    mov edx,resultsum
    int 80H 


    mov ah,[datoNum1+0]
    mov bh,[datoNum2+0]
    
    sub ah,'0'
    sub bh,'0'
    
    add ah,bh
    add ah,'0'
    mov [resul],ah

    mov eax,04 
    mov ebx,01 
    mov ecx,resul
    mov edx,01
    int 80H 
    mov ah,[datoNum1+1]
    mov bh,[datoNum2+1]
    
    sub ah,'0'
    sub bh,'0'
    
    add ah,bh
    add ah,'0'
    mov [resul],ah

    mov eax,04 
    mov ebx,01 
    mov ecx,resul
    mov edx,01
    int 80H 
    jmp salir

salir:
    mov eax,1
    int 80H

    