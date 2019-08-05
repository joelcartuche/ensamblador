;joel cartuche
section .data
    msg db "ingrese primer dato",10
    len equ $-msg
    
    
    resultadosuma db 10,"resultado ****",10
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
    
    jmp mensajesuma




mensajesuma:
    mov al,[nombre]
    mov bl,02
    sub al,'0'
    ;sumamos el tercer dato
    div bl
    cmp ah,00 ;{comoparamos los bit bajos}
    jz igual ; {jz ya qque debemos vericar }
    jmp noigual
    ;if eax = ebx
    ;{ igual}
    ;else{noigual}

igual:
    mov[resultadosuma+11],dword 'par'
    mov eax,4
    mov ebx,1
    
    mov ecx,resultadosuma
    mov edx,lensuma
    int 80H

    jmp salida
    
noigual:
    mov[resultadosuma+11],dword 'impar'
    mov eax,4
    mov ebx,1
    
    mov ecx,resultadosuma
    mov edx,lensuma
    int 80H

    jmp salida


    ;sumamos el tercer dato





salida:
    mov eax,1
    int 80H