# Implementación del método dir_cp
.data  

	txt1: .asciiz "/home/manuel/Documents/Orga/texto1.txt"    
	buffer: .space 1024
	txt2: .asciiz "/home/manuel/Documents/Orga/texto2.txt"

.text

main:
 	 	
	#Abrir archivo de texto txt1
	li   $v0, 13       # Abrir un archivo
	la   $a0, txt1  
	li   $a1, 0       #llamamos al flag 0 para poder usarlo de lectura   
	li   $a2, 0
	syscall            
	
	move $s7, $v0      # Guardamos el file descriptor en $s7

	#Lee desde el archivo
	li   $v0, 14       # Leer un archivo
	move $a0, $s7       
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 1024     # hardcoded buffer length
	syscall
	
	#guarda la cantidad de caracteres leidos
	move $s0, $v0     

	# Cerrar el archivo 
	li   $v0, 16       # Cierra el archivo
	move $a0, $s7      
	syscall
	
	#Abrir el archivo de texto txt2
	li   $v0, 13       # Abrir un archivo
	la   $a0, txt2  
	li   $a1, 1   #llamamos con el flag 1 para poder sobreescribir
	li   $a2, 0
	syscall     
	       
	move $s6, $v0      # Guarda el archivo en $s6

	# Esrcibir desde el archivo
	li   $v0, 15       # Leer un archivo
	move $a0, $s6      #mueve el file descriptor       
	la   $a1, buffer   # address of buffer to which to read
	move   $a2, $s0    # hardcoded buffer length
	syscall    
	
	# Cerrar el archivo 
	li   $v0, 16       # Cierra el archivo
	move $a0, $s6      
	syscall
	
	li $v0,10 #termino el programa
	syscall