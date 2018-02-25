.data
	Arreglo: .align 2
	.space 1024
	mensaje: .asciiz "introduce la letra:"

.text

	li $v0, 4
	la $a0, mensaje
	syscall
	
	li $v0, 8
	la $a0, Arreglo
	la $a1, 10
	syscall
	
	#addi $t0, $zero, 4
	
	
	
	la $t6, Arreglo($t0)
	lb $t5, 4($t6)
	li $v0, 11
	move $a0,$t5
	syscall
	
	li $v0,10 #termino el programa
	syscall