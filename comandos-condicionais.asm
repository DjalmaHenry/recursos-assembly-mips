.data
	msg: .asciiz "Forneça um número: "
	par: .asciiz "O número é par."
	impar: .asciiz "O número é ímpar."
	
	maior: .asciiz "O número é maior que zero."
	menor: .asciiz "O número é menor que zero."
	igual: .asciiz "O número é igual a zero."
.text

	#=========================================================================
	#Programa para saber se o número é PAR ou IMPAR
	
	#imprimindo mensagem para o usuario
	#li $v0, 4
	#la $a0, msg
	#syscall
	
	#ler o número
	#li $v0, 5
	#syscall
	
	#dividindo o valor por 2
	#li $t0, 2
	#div, $v0, $t0
	
	#mfhi $t1 #possui o resto da divisão por 2
	
	#beq $t1, $zero, imprimePar #Se $t1 for igual ao $zero, execute imprimePar
	
	#imprimindo mensagem para o usuario
	#li $v0, 4
	#la $a0, impar
	#syscall
	
	#li $v0, 10 #instrução para encerrar o programa
	#syscall #faça
	
	#imprimePar:
		#imprimindo mensagem para o usuario
		#li $v0, 4
		#la $a0, par
		#syscall
	
	#li $v0, 10 #instrução para encerrar o programa
	#syscall #faça
	
	#===============================================================================
	#Programa para saber se o número é MAIOR, MENOR ou IGUAL a zero
	
	#imprimindo mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	#ler o número
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	beq $t0, $zero, imprimeIgual #Se $t0 for igual ao $zero, execute imprimeIgual
	bgt $t0, $zero, imprimeMaior #Se $t0 for maior que $zero, execute imprimeMaior
	blt $t0, $zero, imprimeMenor #Se $t0 for menor que $zero, execute imprimeMenor
	
	imprimeIgual:
		#imprime que o número é igual a zero
		li $v0, 4
		la $a0, igual
		syscall
		
		li $v0, 10 #instrução para encerrar o programa
	        syscall #faça
		
	imprimeMaior:
		#imprime que o número é maior que zero
		li $v0, 4
		la $a0, maior
		syscall
		
		li $v0, 10 #instrução para encerrar o programa
	        syscall #faça
		
	imprimeMenor:
		#imprime que o número é menor que zero
		li $v0, 4
		la $a0, menor
		syscall
		
		li $v0, 10 #instrução para encerrar o programa
	        syscall #faça
