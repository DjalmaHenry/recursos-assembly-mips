# Proc1 retorna inteiros = {$v0 = a, $v1 = V[4]}
# M[] = $a0, V[] = $a1, i = $a2, j = $a3
# Trabalharemos com {$t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7}
Proc1:
	addi $t0, $zero, 3			#a=3
	addi $t1, $zero, 6			#b=6
	
	#if(b>V[4])
	addi $t2, $zero, 4			#[4]
	add $t2, $t2, $t2
	add $t2, $t2, $t2			#achando endereço 4*[4]
	add $t2, $t2, $a1			#novo endereço
	lw $t3, 0($t2)				#guarda valor de V[4] em $t3
	slt $t4, $t3, $t1			#se v[4] < b | 1= menor que, 0= maior que ou igual
	beq $t4, $zero, Finish			#se $t4 == 0, finaliza o loop
	
	#While(M[5]>(Proc2(a, j)*Proc3(b))
	Loop:
		addi $t5, $zero, 5
		add $t5, $t5, $t5
		add $t5, $t5, $t5		#achando endereço 4*[5]
		add $t5, $t5, $a0		#novo endereço
		lw $t6, 0($t5)			#guarda valor de M[5] em $t6
		addi $sp, $sp, -36		#cria espaço na pilha
		sw $a0, 0($sp)			#salva M[] na pilha
		sw $a1, 4($sp)			#salva V[] na pilha
		sw $a3, 8($sp)			#salva j na pilha
		sw $t0, 12($sp)			#salva a na pilha
		sw $t1, 16($sp)			#salva b na pilha
		sw $t2, 20($sp)			#salva V[4] na pilha
		sw $t6, 24($sp)			#salva valor de M[5] na pilha
		sw $ra, 32($sp)			#salva retorno
		add $a2, $a3, $zero		#adiciona valor de j em $a2
		add $a3, $t0, $zero		#adiciona valor de a em $a3
		jal Proc2			#pula para proc2
		sw $v0, 28($sp)			#salva proc2 na pilha
		lw $a0, 16($sp)			#guarda valor de b em $a0
		jal Proc 3			#pula para proc3
		add $t7, $zero, $v0		#adiciona valor de Proc3
		lw $t1, 28($sp)			#guarda valor de Proc2 em $t1

		#proc2 * proc3
		add $t3, $zero, $t3		#adiciona 0 a $t3
		add $t2, $zero, $t2 		#adiciona 0 ao $t2 (contador)
		Loop2:
			beq $t7, $t2, Exit2	#se $t0 == $t2, finaliza o loop
			add $t3, $t3, $t1	#$t3+proc2
			addi $t2, $zero, 1 	#adiciona 1 ao $t2 (contador)
			j Loop2			#volta para loop2
			
		Exit2:
			lw $t4, 24($sp)		#guarda valor de M[5] em $t4
			slt $t5, $t3, $t4	#se proc2*proc3 < M[5] | 1= menor que, 0= maior que ou igual
			beq $t5, $zero, Exit	#se $t5 == 0, finaliza o loop
			
		#a=(M[5]+b)
		lw $t6, 12($sp)			#guarda valor de a em $t6
		lw $t7, 16($sp)			#guarda valor de b em $t7
		add $t0, $t4, $t7		#a=(M[5]+b)
		lw $a0, 0($sp)			#guarda valor de M[] em $a0
		lw $a1, 4($sp)			#guarda valor de V[] em $a1
		lw $a3, 8($sp)			#guarda valor de j em $a3
		lw $t1, 16($sp)			#guarda valor de b em $t1
		lw $t2, 20($sp)			#guarda valor de V[4] em $t2
		lw $ra, 32($sp)			#guarda valor de retorno
		addi $sp, $sp, 36		#quebra a pilha
		j Loop				#volta para o Loop
	
	#Proc3(b) e Proc2(a, j)
	Exit:
	addi $sp, $sp, -24			#cria espaço na pilha
	sw $a1, 0($sp)				#salva V[] na pilha
	sw $a3, 4($sp)				#salva j na pilha
	sw $t0, 8($sp)				#salva a na pilha
	sw $t2, 12($sp)				#salva V[4] na pilha
	sw $ra, 16($sp)				#salva retorno
	add $a0, $zero, $t1			#guarda valor de b em $a0
	jal Proc 3				#pula para proc3
	lw $a2, 4($sp)				#guarda valor de j em a2
	lw $a3, 8($sp)				#guarda valor de a em a3
	sw $v0, 20($sp)				#salva Proc3 na pilha
	jal Proc2				#pula para proc2
	add $t0, $zero, $v0			#adiciona $v0 a $t0
	lw $t1, 20($sp)				#guarda valor de Proc3 em $t1
	lw $a1, 0($sp)				#guarda valor de V[] em a1
	lw $t2, 12($sp)				#guarda valor de V[4] em $t2
	lw $ra, 16($sp)				#guarda valor de retorno
	addi $sp, $sp, 24			#quebra a pilha
	
	#proc3 / proc2
	add $t4, $zero, $t4 			#adiciona 0 ao $t4 (contador)
	Loop3:
		slt $t5, $t1, $t0		#se proc3 < proc2 | 1= menor que, 0= maior que ou igual
		beq $t5, $zero, Exit3		#se $t4 == $zero, finaliza o loop
		sub $t1, $t1, $t0		#proc3 - proc2
		addi $t4, $zero, 1 		#adiciona 1 ao $t4 (contador)
		j Loop3				#volta para loop2
	
	#V[4]=(Proc3(b) / Proc2(a, j))
	Exit3:
		sw $t4, 0($t2)			#salva (proc3 / proc2) em V[4]
	
	#return a, V[4]
	finish:
		add $v0, $zero, $t0		#guarda valor de a em $v0
		lw $v1, 0($t2)			#guarda valor de V[4] em $v1
		jr $ra				#retorna $ra
