# inicializando os registradores
addi $t2, $zero, $zero      	  # número de elementos copiados para C[  ] de A[  ] e  B[  ]
addi $t3, $zero, $zero	      	# posição inicial C[0]
addi $t4, $zero, $zero	      	# deslocamento do 1º elemento de A[0]
addi $t5, $zero, 396 		        # 396 = 99 x 4 deslocamento do último elemento de B[0]
addi $t7, $zero, $zero        	# contador de elementos
addi $t8, $zero, 5	          	# condição de parada 1
addi $t9, $zero, 100 	        	# condição de parada 2

Proc1:
beq $t7, $t9, End		            # compara se o número de elementos é 100
  
add $t4, $t4, $a1 	           	# endereço A[0, 1, 2, ...]
add $t5, $t5, $a2 	          	# endereço B[99, 98, 97, ...]
add $t3, $t3, $a3 	          	# endereço C[0]

lw $t0, 0 ($t4) 	            	# valor do elemento A[0]
lw $t1, 0($t5)		            	# valor do elemento B[99]
beq $t0, $t8, End 	           	# comparar A [] com 5.
beq $t1, $t8, End 	          	# comparar B [] com 5.
slt  $t6, $t1, $t0 	          	# A[0] > B [99]
bne $t6, $zero, L1 	          	# go to L1
beq $t6, $zero, L2 		          # go to L2


L1:      	# armazenar A em C
sw $t0, 0($t3) 		            	# armazena A em C
addi $t2, $t2, 1 	            	#incrementa o num de elementos em C
j L3
L2: 			# armazena B em C
sw $t1, 0($t3) 			            # armazena A em C
addi $t2, $t2, 1 	            	# incrementa o num de elementos em C
j L3

L3: 			# parte para a proxima verificação
addi $t4, $t4, 4 		            # Parte para a proxima palavra de A[ ]
addi $t5, $t5, -4 	          	# Parte para a palavra anterior de B[ ]
addi $t3, $t3, 4 		            # Endereça a proxima posição de C[ ]
addi $t7, $t7, 1 	            	# Incrementa a quantidade de elementos em C[ ]
j Proc1

End:
add $v0, $zero, $t7
jr $ra
