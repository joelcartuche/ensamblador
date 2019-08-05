
;joel cartuches
section .data
    msg db "ingrese primer dato",10
    len equ $-msg
    
    
    resultadosuma db 10,"*",10
    lensuma equ $-resultadosuma


section .bss
    nombre resb 10
    
    resul resb 10
    resulres resb 10

section .text
    global _start
    
_start:
    jmp lectura1


lectura1:
    
    

    mov eax,4
    mov ebx,1
    mov ecx,resultadosuma
    mov edx,lensuma
    int 80H
    ;guardamos el valor
    jmp salida




salida:
    mov eax,1
    int 80H