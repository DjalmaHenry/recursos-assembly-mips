# V[]  = $a0
# Proc1 retorna resultado da média = {$v0}
Proc1:

	#Soma dos valores
	addi $t0, $zero, 10			#adiciona 10 a $t0 (limite)
	add $t1, $zero, $t1 			#adiciona 0 ao $t1 (contador)
	add $t4, $zero, $t4			#adiciona 0 ao $t1 (soma)
	Loop:
		beq $t0, $t1, Exit		#se $t0 == $t1, finaliza o loop
		add $t2, $zero, $t1		#adiciona index [i]
		add $t2, $t2, $t2
		add $t2, $t2, $t2		#achando endereço 4*[i]
		add $t2, $t2, $a0		#novo endereço
		lw $t3, 0($t2)			#guarda valor de V[i] em $t3
		add $t4, $t4, $t3		#soma valores de V[i]
		addi $t1, $zero, 1 		#adiciona 1 ao $t2 (contador)
		j Loop				#volta para loop
	Exit:
		
	#Divisão dos valores
	addi $t0, $zero, 10			#adiciona 10 a $t0 (limite)
	add $t1, $zero, $t1 			#adiciona 0 ao $t1 (contador)
	Loop2:
		beq $t4, $zero, Exit2	#se $t4 == 0, finaliza o loop
		sub $t4, $t4, $t0		#soma - 10
		addi $t1, $zero, 1 		#adiciona 1 ao $t1 (contador)
		j Loop2				#volta para loop2
	Exit2:
		add $v0, $zero, $t1		#adiciona $t2 a $v0
		jr $ra				#retorna $ra
		