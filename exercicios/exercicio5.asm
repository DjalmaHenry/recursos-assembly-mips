# array fonte $s0, destino $s1
addi $t1, $zero, 50			# condição de parada quantidade
addi $t2, $zero, 20			# condição de parada valores 1
addi $t3, $zero, 10 			# condição de parada valores 2

Proc1: # verificar se o 20 > valor >= 10
	lb $t4, 0($s0) 			# guarda o valor lido em $t4
	slt $t5, $t4, $t2 		# if valor < 20
	beq $t5, $zero, ProximaCondicao
	addi $s0, $zero, 1 		# incrementa 1 no indice do s0
	j Proc1

ProximaCondicao: 			# se a condição for satisfeita, valor lido armazena em $s1
	slt $t5, $t3, $t4 		# valor >= 10
	beq $t5, $zero, Armazenar
	addi $s0, $zero, 1 		# incrementa 1 no indice do s0
	j Proc1

Armazenar:
	slt $t5, $t1, $s0 		# verifica 50 < contador
	bne $t5, $zero, Exit 		# sai se o contador bater 50 ou maior
	sb $s1, 0($s0) 			# armazena o valor de s0 em s1
	addi $s0, $zero, 1 		# incrementa 1 no indice do s0
	j Proc1

Exit:
	add $v0, $zero, $s1
	jr $ra
