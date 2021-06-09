# Proc1 retorna inteiros = {$v0}
# M[] = $a0, V[] = $a1, i = $a2, j = $a3
# Trabalharemos com {$t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7}
Proc1:
	addi $sp, $sp, -20			#cria espaço na pilha
	add $t0, $a2, $zero			#guarda valor de i em $t0
	add $t1, $a3, $zero			#guarda valor de j em $t1
	sw $t0, 0($sp)				#salva i na pilha
	sw $t1, 4($sp)				#salva j na pilha
	sw $a0, 8($sp)				#salva M[] na pilha
	sw $a1, 12($sp)			        #salva V[] na pilha
	sw $ra, 16($sp)			        #salva retorno
	Loop:
		lw $t0, 0($sp)			#guarda valor de i em $t0
		add $t4, $t0, $t0
		add $t4, $t4, $t4
		add $t4, $t4, $t4		#8*i
		lw $t1, 4($sp)			#guarda valor de j em $t1
		add $t5, $t1, $t1
		add $t5, $t5, $t1		#3*j
		add $t6, $t4, $t5		#[8i+3j]
		lw $a1, 12($sp)		        #guarda V[] em $a1
		lw $t2, $t6($a1)		#guarda valor de V[8i+3j] em $t2
		add $t7, $t1, $t1
		add $t7, $t7, $t7		#[4j]
		lw $a0, 8($sp)		        #guarda M[] em $a0
		lw $t3, $t7($a0)		#guarda valor de M[4j] em $t3
		slt $t4, $t3, $t2		#se M[4j] < V[8i+3j] =1
		beq $t4, $zero, Exit		#se $t4 == 0, finaliza o loop
		add $a2, $t2, $zero		#adiciona valor de $t2 em $a2
		jal Proc2			#pula para proc2	
		sw $v0, $t7($a0)		#atualiza valor de M[4j]
		add $a0, $t1, $zero		#adiciona valor de $t1 em $a0
		jal Proc3			#pula para proc3
		add $t7, $t0, $v0		#i+proc3(j)
		sw $t7, 4($sp)			#atualiza valor de j
		j Loop				#continua o loop
	Exit:
		lw $ra, 8($sp)			#guarda retorno em $ra
		lw $v0, 4($sp)			#guarda valor de j em $v0
		addi $sp, $sp, 16		#quebra a pilha
		Jr $ra				#retorna $ra
		
