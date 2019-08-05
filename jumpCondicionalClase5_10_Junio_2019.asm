section .data
    msg db "ingrese primer dato",10
    len equ $-msg
    
    msg1 db "ingrese segundo  dato",10
    len1 equ $-msg1

    resultadosuma db 10,"resultado ****",10
    lensuma equ $-resultadosuma


section .bss
    nombre resb 10
    nombre1 resb 10
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

    jmp mensajesuma




mensajesuma:
    mov[resultadosuma+11],dword 'comp'
    
    mov eax,4
    mov ebx,1
    mov ecx,resultadosuma
    mov edx,lensuma
    int 80H

    mov eax,[nombre]
    mov ebx,[nombre1]

    add eax,'0'
    add ebx,'0'

    cmp eax,ebx
    jz igual
    jmp noigual
    ;if eax = ebx
    ;{ igual}
    ;else{noigual}

igual:
    mov[resultadosuma+11],dword  'igual'
    mov eax,4
    mov ebx,1
    
    mov ecx,resultadosuma
    mov edx,lensuma
    int 80H

    jmp salida
    
noigual:
    mov[resultadosuma+11],dword 'ni'
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

    
;1sum
;2res
;3mul
;4div
;5salir





