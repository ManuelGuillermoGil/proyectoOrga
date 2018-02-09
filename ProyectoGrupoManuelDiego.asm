.data
	archivo: .asciiz "/home/manuel/Documentos/Orga/init.txt" # Nombre del archivo a inicializar
	buffer: .space 1024
	space: .asciiz "\n"

.text

main:

	# Abrir el archivo para escribir
	li   $v0, 13       # Instrucción a syscall para abrir un archivo
	la   $a0, archivo      # Nombre del archivo txt el cual deseamos abrir
	li   $a1, 0        # Abrir para leer
	li   $a2, 0
	syscall            # Abre el archivo y retorna la descripción en el  registro $v0
	move $s6, $v0      # guardamos la descripción del archivo en $s6

	move $a0, $v0	# guardamos la descripción del archivo al registro $a0	
	li $v0, 1	# ahora imprimimos el número en $v0 para saber si se abrio correctamente el archivo
	syscall
	
	addi $v0, $zero, 4  # Imprime una cadena string en el syscall
    	la $a0, space       # load 
    	syscall

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 1024     # hardcoded buffer length
	syscall            # read from file
	
	move $a0, $a1
	li $v0, 4
	syscall
	
	# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
	
	li $v0, 10 #fin del programa
	syscall
