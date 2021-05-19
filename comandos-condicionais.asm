.data
	msg: .asciiz "Forneça um número: "
	par: .asciiz "O número é par."
	impar: .asciiz "O número é ímpar."
.text
	#imprimindo mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	#ler o número
	li $v0, 5
	syscall
	
	#dividindo o valor por 2
	li $t0, 2
	div, $v0, $t0
	
	mfhi $t1 #possui o resto da divisão por 2
	
	beq $t1, $zero, imprimePar #Se $t1 for isual ao $zero, execute imprimePar
	
	#imprimindo mensagem para o usuario
	li $v0, 4
	la $a0, impar
	syscall
	
	li $v0, 10 #instrução para encerrar o programa
	syscall #faça
	
	imprimePar:
		#imprimindo mensagem para o usuario
		li $v0, 4
		la $a0, par
		syscall
	
	li $v0, 10 #instrução para encerrar o programa
	syscall #faça