# Proc1 retorna inteiros = {$v0 = A[6]}
# a = $a0, A[] = $a1, b = $a2, M[] = $a3
# Trabalharemos com {$t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7}
Proc1:
	Loop:
		slt $t0, $a0, $a2		#se A < B | 1= menor que, 0= maior que ou igual
		addi $t1, $zero, 6
		add $t1, $t1, $t1
		add $t1, $t1, $t1		#achando endereco 4*[6]
		add $t1, $t1, $a1		#novo endereco de A[6]
		lw $t2, 0($t1)			#guarda valor de A[6] em $t2
		addi $t3, $zero, 4
		add $t3, $t3, $t3
		add $t3, $t3, $t3		#achando endereco 4*[4]
		add $t3, $t3, $a3		#novo endereco de M[4]
		lw $t4, 0($t3)			#guarda valor de M[4] em $t4
		slt $t5, $t2, $t4			#se A[6] < M[4] | 1= menor que, 0= maior que ou igual
		or $t6, $t0, $t5			#$t0 || $t5
		slt $t7, $a2, $t2		#se B >= A[6] | 1= menor que, 0= maior que ou igual
		addi $sp, $sp, -32		#cria espaco na pilha
		sw $a0, 0($sp)			#salva a na pilha
		sw $a1, 4($sp)			#salva A[] na pilha
		sw $a2, 8($sp)			#salva b na pilha
		sw $a3, 12($sp)		#salva M[] na pilha
		sw $t1, 16($sp)		#salva A[6] na pilha
		sw $t4, 20($sp)		#salva valor de M[4] na pilha
		sw $ra, 24($sp)		#salva retorno
		jal inverteNum			#pula para a subrotina de inverter o resultado de B >= A[6]
		or $t0, $t6, $t7			#$t6 || $t7
		beq $t0, $zero, Exit		#se $t4 == 0, finaliza o loop
		add $a1, $zero, $a2		#guarda b em $a1
		jal Proc2				#chama proc2
		sw $v0, 28($sp)		#salva Proc2 na pilha
		lw $a0, 20($sp)		#guarda valor de M[4] em $a0
		jal Proc3				#chama proc3
		lw $a0, 0($sp)			#guarda valor de a em $a0
		lw $a1, 4($sp)			#guarda valor de A[] em $a1
		lw $a2, 8($sp)			#guarda valor de b em $a2
		lw $a3, 12($sp)		#guarda valor de M[] em $a3
		lw $t1, 16($sp)			#guarda valor de A[6] em $t1
		lw $ra, 24($sp)			#guarda retorno
		lw $t0, 28($sp)			#guarda valor de Proc2 em $t0
		addi $sp, $sp, 32		#quebra a pilha
		add $t2, $zero, $v0		#guarda $v0 em $t2
		sub $t3, $t0, $t2		#Proc2 - Proc3
		sw $t3, 0($t1)			#A[6] = Proc2 - Proc3
		j Loop				#volta para o loop
		
	inverteNum:
		add $t0, $zero, $t0			#adiciona 0 a $t0	
		addi $t1, $zero, 1			#adiciona 1 a $t1
		beq $t0, $t7, inverteZero	#Se $t0 == $t7, inverte de zero para um
		beq $t1, $t7, inverteUm		#Se $t1 == $t7, inverte de um para zero
		inverteZero:
			addi $t7, $zero, 1		#guarda 1 em $t7
			jr $ra				#retorna
		inverteUm:
			add $t7, $zero, $t7		#guarda 0 em $t7
			jr $ra				#retorna
	
	Exit:
		lw $v0, 0($t1)			#guarda valor de A[6] em $v0
		jr $ra				#retorna $ra