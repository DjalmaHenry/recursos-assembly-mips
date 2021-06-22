# Proc1 retorna resultado = {$v0 = a, $}
# A = $a0, B = $a1, X = $a2, Y = $a3
Main:
	addi $sp, $sp, -20		#cria espaco na pilha
	sw $a0, 0($sp)			#salva A na pilha
	sw $a1, 4($sp)			#salva B na pilha
	sw $a2, 8($sp)			#salva X na pilha
	sw $a3, 12($sp)			#salva Y na pilha
	sw $ra, 16($sp)			#salva retorno
	
	#Y^500
	lw $a0, 12($sp)			#guarda Y em $a0
	addi $a1, $zero, 500		#adiciona 500 em $a1
	jal POT				#chama potencia
	
	#A*Y
	add $a1, $zero, $v0		#guarda $v0 em $a1
	lw $a0, 0($sp)			#guarda A em $a0
	jal MULT			#chama multiplicacao
	
	#A/B
	add $a3, $zero, $v1		#guarda $v1 em $a3
	lw $a2, 4($sp)			#guarda B em $a2
	jal DIV 			#chama divisao
	
	#A^X
	add $a0, $zero, $v0		#guarda $v0 em $a0
	lw $a1, 8($sp)			#guarda X em $a1
	jal POT				#chama potencia
	lw $ra, 16($sp)			#guarda retorno
	addi $sp, $sp, 20		#quebra a pilha
	jr $ra				#retorna valor em $v0
