.data
	msg: .asciiz "Forne�a um n�mero: "
	par: .asciiz "O n�mero � par."
	impar: .asciiz "O n�mero � �mpar."
.text
	#imprimindo mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	#ler o n�mero
	li $v0, 5
	syscall
	
	#dividindo o valor por 2
	li $t0, 2
	div, $v0, $t0
	
	mfhi $t1 #possui o resto da divis�o por 2
	
	beq $t1, $zero, imprimePar #Se $t1 for isual ao $zero, execute imprimePar
	
	#imprimindo mensagem para o usuario
	li $v0, 4
	la $a0, impar
	syscall
	
	li $v0, 10 #instru��o para encerrar o programa
	syscall #fa�a
	
	imprimePar:
		#imprimindo mensagem para o usuario
		li $v0, 4
		la $a0, par
		syscall
	
	li $v0, 10 #instru��o para encerrar o programa
	syscall #fa�a