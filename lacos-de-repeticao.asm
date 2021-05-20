.data
	msg: .asciiz "Forneça um número: "
	erro: .asciiz "Erro, o valor fornecido é menor que zero, informe um valor positivo. "
	espaco: .byte ' '
.text
	#Programa de contagem. Forneça um valor inteiro e positivo, que o programa irá contar de zero até esse número.
	
	inicio:
		#imprimindo mensagem para o usuario
		li $v0, 4
		la $a0, msg
		syscall
			
		#ler o número
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
		
		#imprimir espaço em branco
		li $v0, 4
		la $a0, espaco
		syscall
		
		addi $t1, $t1, 1 #somo mais 1 em $t1
		j while #chamo novamente o laço de repetição
		
	saida:
		li $v0, 10 #instrução para encerrar o programa
	        syscall #faça
	        
	validacao:
		#imprimindo mensagem para o usuario
		li $v0, 4
		la $a0, erro
		syscall
		j inicio #chamo novamente o inicio do programa