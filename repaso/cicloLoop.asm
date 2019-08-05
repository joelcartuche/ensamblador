section .data
    userMsg db "*",0xA,0xD
    lenUserMsg equ $ - userMsg
    

section .bss
    num resb 10
    num2 resb 10
section .text
    global _start
_start:
    mov eax, 4 ; llama al sistema (sys_write)
    mov ebx, 1  ;stdout
    mov ecx, userMsg ;msg pantalla
    mov edx, lenUserMsg ;longitud del mensaje
    int 0x80    ;lamada al sistema de interrucciones
    

    mov eax, 0
    add eax,'0'
    mov ecx, 2
    add ecx,'0'

    loop_for:
        mov [num],eax
        mov [num2],ecx

        mov eax, 4 ; llama al sistema (sys_write)
        mov ebx, 1  ;stdout
        mov ecx, userMsg ;msg pantalla
        mov edx, lenUserMsg ;longitud del mensaje
        int 0x80

        mov eax,[num]
        mov ecx,[num2]

        loop loop_for

    jmp salir


salir:
    mov eax,1
    int 80H

    
;for(int i =9; i>0;i--){
;    for(int j=9;j>0;j--){
;        sout("*")
;    }
;    j-=1;
;}