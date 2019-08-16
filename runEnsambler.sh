#!/bin/bash
gnome-terminal -e "/bin/bash -c ' nasm -f elf  $1; ld -m elf_i386 -s -o $2 $2.o;./$2; echo; read -p 'presione enter'; exit; exec /bin/bash'; &"
#-p 'Pulse intro para salir'