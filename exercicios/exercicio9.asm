#azul = $a1, amarelo = $a2, verde = $a3
#Ganhos por cor: azul = $t0, amarelo = $t1, verde = $t2
#Ganhos total diario = $t3
.main:
	addi $a1, $zero, 3			#armazena 3 em $a0
	add $a0, $zero, $a1			#adiciona $a1 a $a0
	jal calculaGanhos			#chama calculaGanhos
	add $t0, $zero, $v0			#guarda valor de $v0 em $t0
	addi $a2, $zero, 2			#armazena 2 em $a0
	add $a0, $zero, $a2			#adiciona $a2 a $a0
	jal calculaGanhos			#chama calculaGanhos
	add $t1, $zero, $v0			#guarda valor de $v0 em $t1
	addi $a3, $zero, 5			#armazena 5 em $a0
	add $a0, $zero, $a3			#adiciona $a3 a $a0
	jal calculaGanhos			#chama calculaGanhos
	add $t2, $zero, $v0			#guarda valor de $v0 em $t2
	add $t3, $zero, $t0			#adiciona $t0 a $t3 
	add $t3, $t3, $t1			#soma $t1 a $t3
	add $t3, $t3, $t2			#soma $t2 a $t3
	j Exit						#finaliza programa

calculaGanhos:
	add $t4, $zero, $t4 			#adiciona 0 ao $t4 (contador)
	add $t5, $zero, $t5			#adiciona 0 ao $t5 (resultado)
	Loop:
		beq $a0, $t4, Exit2		#se $a0 == $t4, finaliza o loop
		addi $t5, $t5, 500		#adiciona 500 ao $t5
		addi $t4, $zero, 1 		#adiciona 1 ao $t4 (contador)
		j Loop				#volta para loop
	Exit2:
		add $v0, $zero, $t5		#adiciona $t5 a $v0
		jr $ra				#retorna
	
Exit: