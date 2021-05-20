.data
	msg: .asciiz "Forne�a um n�mero: "
	erro: .asciiz "Erro, o valor fornecido � menor que zero, informe um valor positivo. "
	espaco: .byte ' '
.text
	#Programa de contagem. Forne�a um valor inteiro e positivo, que o programa ir� contar de zero at� esse n�mero.
	
	inicio:
		#imprimindo mensagem para o usuario
		li $v0, 4
		la $a0, msg
		syscall
			
		#ler o n�mero
		li $v0, 5
		syscall
		
		move $t0, $v0
		move $t1, $zero
	
		blt $t0, $zero, validacao #Se $t0 for menor que $zero, execute validacao
	
	while: 
		bgt $t1, $t0, saida #Se $t1 for maior que $t0, execute saida
		
		#imprimir $t1
		li $v0, 1
		move $a0, $t1
		syscall
		
		#imprimir espa�o em branco
		li $v0, 4
		la $a0, espaco
		syscall
		
		addi $t1, $t1, 1 #somo mais 1 em $t1
		j while #chamo novamente o la�o de repeti��o
		
	saida:
		li $v0, 10 #instru��o para encerrar o programa
	        syscall #fa�a
	        
	validacao:
		#imprimindo mensagem para o usuario
		li $v0, 4
		la $a0, erro
		syscall
		j inicio #chamo novamente o inicio do programa