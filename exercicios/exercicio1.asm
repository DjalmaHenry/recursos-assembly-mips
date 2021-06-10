# Proc1 retorna inteiros = {$v0}
# M[] = $a0, V[] = $a1, i = $a2, j = $a3
# Trabalharemos com {$t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7}
Proc1:
	Loop:
		add $t4, $a2, $a2
		add $t4, $t4, $t4
		add $t4, $t4, $t4		#8*i
		add $t5, $a3, $a3
		add $t5, $t5, $a3		#3*j
		add $t6, $t4, $t5		#[8i+3j]
		add $t6, $t6, $t6
		add $t6, $t6, $t6		#achando o endereço 4*[8i+3j]
		add $t6, $t6, $a1		#novo endereço
		lw $t2, 0($t6)			#guarda valor de V[8i+3j] em $t2
		add $t7, $a3, $a3
		add $t7, $t7, $t7		#[4j]
		add $t7, $t7, $t7
		add $t7, $t7, $t7		#achando o endereço 4*[4j]
		add $t7, $t7, $a0		#novo endereço
		lw $t3, 0($t7)			#guarda valor de M[4j] em $t3
		slt $t4, $t3, $t2		#se M[4j] < V[8i+3j] =1
		beq $t4, $zero, Exit		#se $t4 == 0, finaliza o loop
		addi $sp, $sp, -24		#cria espaço na pilha
		sw $a2, 0($sp)			#salva i na pilha
		sw $a3, 4($sp)			#salva j na pilha
		sw $a0, 8($sp)			#salva M[] na pilha
		sw $a1, 12($sp)			#salva V[] na pilha
		sw $ra, 16($sp)			#salva retorno
		sw $t7, 20($sp)			#salva M[4j] na pilha
		add $a2, $t2, $zero		#adiciona valor de $t2 em $a2
		jal Proc2			#pula para proc2	
		lw $a3, 4($sp)			#guarda valor de j
		lw $t7, 20($sp)			#guarda valor de M[4j]
		sw $v0, 0($t7)			#atualiza valor de M[4j]
		add $a0, $a3, $zero		#adiciona valor de $a3 em $a0
		jal Proc3			#pula para proc3
		lw $a2, 0($sp)			#guarda valor de i
		lw $a3, 4($sp)			#guarda valor de j
		lw $a0, 8($sp)			#guarda valor de M[]
		lw $a1, 12($sp)			#guarda valor de V[]
		lw $ra, 16($sp)			#guarda valor de retorno
		addi $sp, $sp, 24		#quebra a pilha
		add $a3, $a2, $v0		#j=i+proc3(j)
		j Loop				#continua o loop
	Exit:
		add $v0, $a3, $zero		#guarda valor de j em $v0
		jr $ra				#retorna $ra
		
