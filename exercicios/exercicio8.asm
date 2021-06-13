# Proc1 retorna inteiros = {$v0 = a, $v1 = V[4]}
# M[] = $a0, V[] = $a1, i = $a2, j = $a3
# Trabalharemos com {$t's e $s's}
# Lembrando que os registradores $s's salvam valores mesmo depois de funções
# Os registradores $t's são alterados após funções
Proc1:
	#salvando valores que serão usados
	addi $s0,$zero,2					#salvando o valor de a em $s0
	addi $s1,$zero,3					#salvando o valor de b em $s1

	#Matriz[8]
	addi $t0,$zero,8					#[8]
	add $t0,$t0,$t0
	add $t0,$t0,$t0						#achando o endereço 4*[8]
	add $t0,$t0,$a0						#novo endereço M[8]

	#2*Vetor[3]
	addi $t1,$zero,3					#[8]
	add $t1,$t1,$t1
	add $t1,$t1,$t1						#achando o endereço 4*[3]
	add $t1,$t1,$a1						#novo endereço V[3]
	add $t1,$t1,$t1						#2*V[3]

	#Matriz[8] > 2*Vetor[3]
	slt $t2,$t1,$t0						#se Matriz[8] < 2*Vetor[3] | 1=menor que,0=maior que ou igual
	beq $t2,$zero,Fim					#Se $t2==0, finaliza o loop

	#!a<=i
	slt $t3,$s0,$a2						#se a < i | 1=menor que,0=maior que ou igual
	bne $t3,$zero,Fim

	#!b>=j
	slt $t4,$a3,$s1						#se j < b | 1=menor que,0=maior que ou igual
	bne $t4,$zero,Fim

	#while((Matriz[8]>2(Vetor[3]))!((a<=i)&&(b>=j)))
	Loop:
		#[3+2]
		addi $t5,$zero,3				#$t5=3
		addi $t6,$zero,2				#$t6=2
		add $t7,$t5,$t6					#$t7=3+2

		#4*[3+2]
		add $t7,$t7,$t7
		add $t7,$t7,$t7

		#4*Vetor[3+2]	
		add $t7,$t7,$a1					#Novo endereço de V[5]
		 $a2,0($7)					#V[5]=i

		#salvando valores antes de entrarem no Proc2
		add $s2,$zero,$a0				#guardando em $s2 a M[]
		add $s3,$zero,$a1				#guardando em $s3 o V[]
		add $s4,$zero,$a2				#guardando em $s4 o i
		add $s5,$zero,$a3				#guardando em $s5 o j

		#antes do Proc2(int i,j)
		add $a1,$zero,$a2				#adiciona o valor de i em $a1
		#o $a3 já contém o j

		#Proc 2
		jal Proc2
		add $s5,$zero,$v0				#guarda o valor de Proc2 em j

		#b=i+j
		add $s1,$s4,$s5

		#Volta pro loop
		j Loop

	Fim:
		slt $t0,$s0,$s1					#se a<b | 1=maior 0=menor ou igual
		beq $t0,$zero,RetornaMatriz			#Se $t0==0, vai para o if
		add $v0,$zero,$s0				#guarda em $v0=a
		add $v1,$zero,$s1				#guarda em $v1=b
		jr $ra

	RetornaMatriz:
		addi $t1,$zero,4				#[4]
		add $t1,$t1,$t1	
		add $t1,$t1,$t1					#4*[4]
		add $t1,$t1,$s2					#novo endereço M[4]
		lw $v0,0($t1)					#guarda em $v0=M[4]
		jr $ra
