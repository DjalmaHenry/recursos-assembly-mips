.data
	msg: .asciiz "Forne�a um n�mero: "
	par: .asciiz "O n�mero � par."
	impar: .asciiz "O n�mero � �mpar."
	
	maior: .asciiz "O n�mero � maior que zero."
	menor: .asciiz "O n�mero � menor que zero."
	igual: .asciiz "O n�mero � igual a zero."
.text

	#=========================================================================
	#Programa para saber se o n�mero � PAR ou IMPAR
	
	#imprimindo mensagem para o usuario
	#li $v0, 4
	#la $a0, msg
	#syscall
	
	#ler o n�mero
	#li $v0, 5
	#syscall
	
	#dividindo o valor por 2
	#li $t0, 2
	#div, $v0, $t0
	
	#mfhi $t1 #possui o resto da divis�o por 2
	
	#beq $t1, $zero, imprimePar #Se $t1 for igual ao $zero, execute imprimePar
	
	#imprimindo mensagem para o usuario
	#li $v0, 4
	#la $a0, impar
	#syscall
	
	#li $v0, 10 #instru��o para encerrar o programa
	#syscall #fa�a
	
	#imprimePar:
		#imprimindo mensagem para o usuario
		#li $v0, 4
		#la $a0, par
		#syscall
	
	#li $v0, 10 #instru��o para encerrar o programa
	#syscall #fa�a
	
	#===============================================================================
	#Programa para saber se o n�mero � MAIOR, MENOR ou IGUAL a zero
	
	#imprimindo mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	#ler o n�mero
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	beq $t0, $zero, imprimeIgual #Se $t0 for igual ao $zero, execute imprimeIgual
	bgt $t0, $zero, imprimeMaior #Se $t0 for maior que $zero, execute imprimeMaior
	blt $t0, $zero, imprimeMenor #Se $t0 for menor que $zero, execute imprimeMenor
	
	imprimeIgual:
		#imprime que o n�mero � igual a zero
		li $v0, 4
		la $a0, igual
		syscall
		
		li $v0, 10 #instru��o para encerrar o programa
	        syscall #fa�a
		
	imprimeMaior:
		#imprime que o n�mero � maior que zero
		li $v0, 4
		la $a0, maior
		syscall
		
		li $v0, 10 #instru��o para encerrar o programa
	        syscall #fa�a
		
	imprimeMenor:
		#imprime que o n�mero � menor que zero
		li $v0, 4
		la $a0, menor
		syscall
		
		li $v0, 10 #instru��o para encerrar o programa
	        syscall #fa�a
