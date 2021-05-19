.data
	#área para dados na memória principal
	
	msg: .asciiz "Olá mundo!" #mensagem a ser exibida
	
	caractere: .byte 'A' #caractere a ser exibido
	
	idade: .word 20 #valor inteiro
	
	entrada: .asciiz "Insira a sua idade: " #mensagem a ser exibida
	
	saida: .asciiz "Sua idade é " #mensagem a ser exibida
	
	pergunta: .asciiz "Insira seu nome: " #mensagem a ser exibida
	
	saudacao: .asciiz "Olá, " #mensagem a ser exibida
	
	nome: .space 25 #alocando espaço na memória
	
	msgNum: .asciiz "Insira um número decimal: " #mensagem a ser exibida
	
	zeroF: .float 0.0
	
	zeroD: .double 0.0
	
.text
	#área para instruções do programa
	
	#===================================================================
	
	#impressão de string
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, msg #indica o endereço que está a string
	#syscall #faça, imprima
	#la $a0, caractere #indica o endereço que está o caractere
	#syscall #faça, imprima
	
	#===================================================================
	
	#impressão de inteiro
	#li $v0, 1 #instrução para impressão de inteiro
	#lw $a0, idade #indica o endereço que está o valor inteiro
	#syscall #faça, imprima
	
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
	
	#impressão de valor inteiro
	#li $v0, 1 #instrução para impressão de inteiro
	#move $a0, $s2 #movendo endereço do inteiro para o registrador de impressão
	#syscall #faça, imprima
	
	#Potência de 2 com valor inteiro
	#li $t0, 1 #registrando valor inteiro
	#sll $s3, $t0, 10 #fazendo a potência de 2 no valor em $t0, multiplicamos $t0 por 2^10
	
	#Divisão de valores inteiros
	#li $t0, 32 #registrando valor inteiro
	#li $t1, 5 #registrando valor inteiro
	#div $t0, $t1 #Dividindo $t0 por $t1, armazena em lo e hi
	#mflo $s4 #movendo o resultado da divisão
	#mfhi $s5 #movendo o resto da divisão
	
	#Divisão de potência de 2 com valor inteiro
	#li $t0, 32 #registrando valor inteiro
	#srl $s6, $t0, 2 #fazendo a divisão da potência de 2 no valor em $t0, dividimos $t0 por 2^2
	
	#===============================================================================================
	
	#impressão da entrada
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, entrada #indica o endereço que está a string
	#syscall #faça, imprima
	
	#leitura do inteiro
	#li $v0, 5 #instrução para leitura de inteiros, armazena em $v0
	#syscall #faça
	
	#salvando o inteiro
	#move $t0, $v0 #movendo endereço do inteiro para outro registrador
	
	#impressão da saida
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, saida #indica o endereço que está a string
	#syscall #faça, imprima
	
	#impressão do inteiro
	#li $v0, 1 #instrução para impressão de inteiros
	#move $a0, $t0 #movendo endereço do inteiro para o registrador de impressão
	#syscall #faça, imprima
	
	#===================================================================================
	
	#impressão da pergunta
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, pergunta #indica o endereço que está a string
	#syscall #faça, imprima
	
	#leitura do nome
	#li $v0, 8 #instrução para leitura de string
	#la $a0, nome #armazenando a entrada no espaço alocado na memória
	#la $a1, 25 #informando o tamanho da string de entrada
	#syscall #faça
	
	#impressão da saudacao
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, saudacao #indica o endereço que está a string
	#syscall #faça, imprima
	
	#impressão do nome
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, nome #indica o endereço que está a string
	#syscall #faça, imprima
	
	#=========================================================================
	
	#impressão da mensagem para o usuário
	#li $v0, 4 #instrução para impressão de string ou char
	#la $a0, msgNum #indica o endereço que está a string
	#syscall #faça, imprima
	
	#leitura do Float
	#li $v0, 6 #instrução para leitura de float, valor lido estará em $f0
	#syscall #faça
	
	#movendo o float para o registrador de impressão
	#lwc1 $f1, zeroF #armazenando o endereço do float no registrador
	#add.s $f12, $f1, $f0 #usando a soma de zero com o valor em $f0, para mover o valor de registrador
	
	#impressão do float
	#li $v0, 2 #instrução para impressão de float em $f12
	#syscall #faça, imprima
	
	#=======================================================================
	
	#impressão da mensagem para o usuário
	li $v0, 4 #instrução para impressão de string ou char
	la $a0, msgNum #indica o endereço que está a string
	syscall #faça, imprima
	
	#leitura do Double
	li $v0, 7 #instrução para leitura de double, valor lido estará em $f0
	syscall #faça
	
	#movendo o double para o registrador de impressão
	ldc1 $f2, zeroD #armazenando o endereço do double no registrador
	add.d $f12, $f2, $f0 #usando a soma de zero com o valor em $f0, para mover o valor de registrador
	
	#impressão do double
	li $v0, 3 #instrução para impressão de double em $f12
	syscall #faça, imprima
	
	#=======================================================================
	
	li $v0, 10 #instrução para encerrar o programa
	syscall #faça
