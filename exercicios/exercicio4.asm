# Save[] = $a0, Test[] = $a1, i = $a2, j = $a3
# Trabalharemos com {$t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7}

#While(Save[i] != Test[j])
Loop:
	add $t0, $t0, $a2
	add $t0, $t0, $t0			#achando endereço 4*i
	add $t0, $t0, $a0			#novo endereço de Save[i]
	lw $t1, 0($t0)				#guarda valor de Save[i] em $t1
	add $t2, $t2, $a3
	add $t2, $t2, $t2			#achando endereço 4*j
	add $t2, $t2, $a1			#novo endereço de Test[j]
	lw $t3, 0($t2)				#guarda valor de Test[j] em $t3
	beq $t1, $t3, Exit			#se Save[i] == Test[j], finaliza o loop
	beq $a2, $a3, If			#i == j, chama o if
	bne $a2, $a3, Else			#i != j, chama o else
	add $a2, $a2, $a3			#i=i+j
	j Loop					#volta o loop

#Save[i]=Save[i+1]+2
If:
	addi $t4, $a2, 1			#i+1
	add $t4, $t4, $t4
	add $t4, $t4, $t4			#achando endereço 4*i
	add $t4, $t4, $a0			#novo endereço de Save[i+1]
	lw $t5, 0($t4)				#guarda valor de Save[i+1] em $t5
	addi $t5, $t5, 2			#$t5 = Save[i+1]+2
	sw $t5, 0($t0)				#Save[ i ] = $t5
	jr $ra					#retorna
	
#Save[i]=Save[i+1]-2
Else:
	addi $t4, $a2, 1			#i+1
	add $t4, $t4, $t4
	add $t4, $t4, $t4			#achando endereço 4*i
	add $t4, $t4, $a0			#novo endereço de Save[i+1]
	lw $t5, 0($t4)				#guarda valor de Save[i+1] em $t5
	subi $t5, $t5, 2				#$t5 = Save[i+1]-2
	sw $t5, 0($t0)				#Save[ i ] = $t5
	jr $ra					#retorna

Exit: