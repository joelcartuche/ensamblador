section .data
     msg1 db 'la suma de 4+5 es = ',0xa;como un arreglo el 0xa en este caso enter
     len1 equ $-msg1

section .bss
    resul resb 1

     
section .text
	global _start
    
_start: 


    ;-------------imprime los mensajes-------------------------
    mov eax,04 
    mov ebx,01 
    mov ecx,msg1
    mov edx,len1
    int 80H 

    mov eax,4
    mov ebx,5

    add eax,ebx
    add eax,'0'    
    mov [resul],eax ;colocar [] para acceder al contenido de la memoria sin esto estamos modificando la direccion de memoria

    mov eax,04 ; para imprimir volvemos a asignar los valores 
    mov ebx,01 
    mov ecx,resul 
    mov edx,01
    int 80H 

    mov eax, 1
    mov ebx,0
    int 80H








