# Implementación del dir_init
.data
	archivo: .space 1024
	mensaje: .asciiz "introduce el archivo:" "\n"


.text

main:
	
	li $v0, 4	#imprime el mensaje de pedir archivo
	la $a0, mensaje
	syscall
	
	la $a0, archivo
	li $a1, 1024
	li $v0, 8 #el usuario introduce el archivo
	syscall
	
	move $a0,$v0
	
	jal dir_init
	
	li $v0,10 #termino el programa
	syscall
	
	
dir_init:
	#Abrir el archivo
	li   $v0, 13       # Abrir un archivo
	la   $a0, archivo  
	li   $a1, 0        
	li   $a2, 0
	syscall            
	move $s7, $v0      # Guarda el archivo en $s7
	
	move $a0, $v0

	
	li $v0, 1	#imprime el file descriptor
	syscall
	
	jr $ra