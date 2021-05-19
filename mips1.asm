.data
	#�rea para dados na mem�ria principal
	
	msg: .asciiz "Ol� mundo!" #mensagem a ser exibida
	
	caractere: .byte 'A' #caractere a ser exibido
	
	idade: .word 20 #valor inteiro
	
	entrada: .asciiz "Insira a sua idade: " #mensagem a ser exibida
	
	saida: .asciiz "Sua idade � " #mensagem a ser exibida
	
	pergunta: .asciiz "Insira seu nome: " #mensagem a ser exibida
	
	saudacao: .asciiz "Ol�, " #mensagem a ser exibida
	
	nome: .space 25 #alocando espa�o na mem�ria
	
	msgNum: .asciiz "Insira um n�mero decimal: " #mensagem a ser exibida
	
	zeroF: .float 0.0
	
	zeroD: .double 0.0
	
.text
	#�rea para instru��es do programa
	
	#===================================================================
	
	#impress�o de string
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, msg #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	#la $a0, caractere #indica o endere�o que est� o caractere
	#syscall #fa�a, imprima
	
	#===================================================================
	
	#impress�o de inteiro
	#li $v0, 1 #instru��o para impress�o de inteiro
	#lw $a0, idade #indica o endere�o que est� o valor inteiro
	#syscall #fa�a, imprima
	
	#===================================================================
	
	#Soma valores inteiros
	#li $t0, 10 #registrando valor inteiro
	#lw $t1, idade #registrando valor inteiro
	#add $s0, $t0, $t1 #Somando valores inteiros $s0 = $t0 + idade
	
	#Subtrai valores inteiros
	#li $t0, 10 #registrando valor inteiro
	#lw $t1, idade #registrando valor inteiro
	#sub $s1, $t1, $t0 #Subtraindo valores inteiros $s0 = $t0 + idade
	
	#Multiplica valores inteiros
	#li $t0, 10 #registrando valor inteiro
	#lw $t1, idade #registrando valor inteiro
	#mul $s2, $t0, $t1 #Multiplicando valores inteiros $s0 = $t0 + idade
	
	#impress�o de valor inteiro
	#li $v0, 1 #instru��o para impress�o de inteiro
	#move $a0, $s2 #movendo endere�o do inteiro para o registrador de impress�o
	#syscall #fa�a, imprima
	
	#Pot�ncia de 2 com valor inteiro
	#li $t0, 1 #registrando valor inteiro
	#sll $s3, $t0, 10 #fazendo a pot�ncia de 2 no valor em $t0, multiplicamos $t0 por 2^10
	
	#Divis�o de valores inteiros
	#li $t0, 32 #registrando valor inteiro
	#li $t1, 5 #registrando valor inteiro
	#div $t0, $t1 #Dividindo $t0 por $t1, armazena em lo e hi
	#mflo $s4 #movendo o resultado da divis�o
	#mfhi $s5 #movendo o resto da divis�o
	
	#Divis�o de pot�ncia de 2 com valor inteiro
	#li $t0, 32 #registrando valor inteiro
	#srl $s6, $t0, 2 #fazendo a divis�o da pot�ncia de 2 no valor em $t0, dividimos $t0 por 2^2
	
	#===============================================================================================
	
	#impress�o da entrada
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, entrada #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	
	#leitura do inteiro
	#li $v0, 5 #instru��o para leitura de inteiros, armazena em $v0
	#syscall #fa�a
	
	#salvando o inteiro
	#move $t0, $v0 #movendo endere�o do inteiro para outro registrador
	
	#impress�o da saida
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, saida #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	
	#impress�o do inteiro
	#li $v0, 1 #instru��o para impress�o de inteiros
	#move $a0, $t0 #movendo endere�o do inteiro para o registrador de impress�o
	#syscall #fa�a, imprima
	
	#===================================================================================
	
	#impress�o da pergunta
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, pergunta #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	
	#leitura do nome
	#li $v0, 8 #instru��o para leitura de string
	#la $a0, nome #armazenando a entrada no espa�o alocado na mem�ria
	#la $a1, 25 #informando o tamanho da string de entrada
	#syscall #fa�a
	
	#impress�o da saudacao
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, saudacao #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	
	#impress�o do nome
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, nome #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	
	#=========================================================================
	
	#impress�o da mensagem para o usu�rio
	#li $v0, 4 #instru��o para impress�o de string ou char
	#la $a0, msgNum #indica o endere�o que est� a string
	#syscall #fa�a, imprima
	
	#leitura do Float
	#li $v0, 6 #instru��o para leitura de float, valor lido estar� em $f0
	#syscall #fa�a
	
	#movendo o float para o registrador de impress�o
	#lwc1 $f1, zeroF #armazenando o endere�o do float no registrador
	#add.s $f12, $f1, $f0 #usando a soma de zero com o valor em $f0, para mover o valor de registrador
	
	#impress�o do float
	#li $v0, 2 #instru��o para impress�o de float em $f12
	#syscall #fa�a, imprima
	
	#=======================================================================
	
	#impress�o da mensagem para o usu�rio
	li $v0, 4 #instru��o para impress�o de string ou char
	la $a0, msgNum #indica o endere�o que est� a string
	syscall #fa�a, imprima
	
	#leitura do Double
	li $v0, 7 #instru��o para leitura de double, valor lido estar� em $f0
	syscall #fa�a
	
	#movendo o double para o registrador de impress�o
	ldc1 $f2, zeroD #armazenando o endere�o do double no registrador
	add.d $f12, $f2, $f0 #usando a soma de zero com o valor em $f0, para mover o valor de registrador
	
	#impress�o do double
	li $v0, 3 #instru��o para impress�o de double em $f12
	syscall #fa�a, imprima
	
	#=======================================================================
	
	li $v0, 10 #instru��o para encerrar o programa
	syscall #fa�a
