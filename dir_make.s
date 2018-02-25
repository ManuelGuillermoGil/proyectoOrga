# Implementación del método dir_make
.data
	archivo: .space 20
	mensaje: .asciiz "Introduce el archivo que deseas crear:" "\n"
	mensaje2: .asciiz "Introduce que quieres que haya en el archivo:" "\n"
	contenido: .space 1024
	
.text

main:	
	li $v0, 4	#imprime el mensaje de pedir archivo
	la $a0, mensaje
	syscall
	
	#pedimos el nombre y el contenido al usuario
	li $v0, 8 #el usuario introduce el archivo
	la $a0, archivo
	li $a1, 20
	syscall
	
	addi $t1, $zero, 0 #inicializa en i = 0
	move $t0, $t1 #inicializando en i = 0
	
	jal while
	
	li $v0, 4	#imprime el mensaje de pedir el contenido del archivo
	la $a0, mensaje2
	syscall
	
	la $a0, contenido
	li $a1, 1024
	li $v0, 8  #el usuario introduce el archivo
	syscall
	
	jal dir_make
	
	li $v0,10 #termino el programa
	syscall
		
dir_make:
	
	#Abrir el archivo
	li   $v0, 13       # Abrir un archivo
	la   $a0, archivo  
	li   $a1, 1        
	li   $a2, 0
	syscall            
	move $s7, $v0      # Guarda el file descriptor del archivo en $s7
	
	#move $a0, $v0
	
	#esrcibir desde el archivo
	li   $v0, 15       # Leer un archivo
	move $a0, $s7      #mueve el file descriptor       
	la   $a1, contenido   # address of buffer to which to read
	li   $a2, 1024    # hardcoded buffer length
	syscall  
	
	jr $ra
	
while:	
	beq $t0, 10, exit
		
	lb $t0, archivo($t1)
		
	addi $t1, $t1, 1 #i = i + 1
		
	j while 
				
exit:
	subi $t1, $t1, 1
	move $t2, $zero
		
	sb $t2, archivo($t1)
		
	jr $ra
