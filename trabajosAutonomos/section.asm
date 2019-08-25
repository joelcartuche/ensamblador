section .data
	mensaje db "hola"
	len equ $-mensaje

section .text
	global _start

_start:
	mov eax,04
	mov ebx,01
	mov ecx,mensaje
	mov edx,len
	int 80H

	mov eax,1
	int 80H
