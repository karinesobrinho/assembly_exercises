#Escreva um programa que detecte se uma string com uma sequência de parênteses 
#está balanceada ou não. 
#Uma sequência de parênteses é dita balanceada se, para todo “)“, há 
#um “(” correspondente que apareceu antes na sequência. 
#Caso a sequência esteja balanceada, o programa deve imprimir o texto “Balanceada” 
#seguido de um fim de linha. 
#Caso contrário, deve imprimir o texto “Desbalanceada” seguido de um fim de linha. 
#As strings de entrada são compostas apenas dos caracteres “(“, “)”, e “.”. 
#O caracter “.” indica o fim da sequência.

#Primeiro exemplo de entrada:
#()(())((())).
#Primeiro exemplo de saída:
#Balanceada
#Segundo exemplo de entrada:
#(()(()).
#Segundo exemplo de saída:
#Desbalanceada

.data
str1: .asciiz "Balanceada\n"
str2: .asciiz "Desbalanceada\n"
.text

main:
    move $t0, $zero #conta (
    move $t1, $zero #conta )
    move $t3, $zero #armazena caracter do input

    loop: 
        addi $v0, $zero, 12 #chamada de escrita 
        syscall
        add $t3, $v0, $zero #armazena caracter escrito em $t3
        
        beq $t3, '.', saiLoop #quando tiverem o mesmo valor sai do loop

        beq $t3, '(', inc_abre #quando tiverem o mesmo valor vai para inc_abre
        beq $t3, ')', inc_fecha #quando tiverem o mesmo valor vai para inc_fecha
        j loop #volta no comeco do loop

    inc_abre:
        addi $t0, 1 #incrementa contagem de (
        j loop #volta para o loop de leitura e redirecionamento

    inc_fecha:
        addi $t1, 1 #incrementa contagem de )

        slt $t4, $t0, $t1 #se $t0 for menor do que $t1 $t4 recebe 1, ja esta desbalanceda
        
        j loop #volta para o loop de leitura e redirecionamento

    print_bal:
        addi $v0, $zero, 4 # codigo syscall print_str
        la $a0, str1 # primeira Balanceada a ser exibida
        syscall
        j saiPrograma #pula para encerrar o programa

    print_des:
        addi $v0, $zero, 4 # codigo syscall print_str
        la $a0, str2 # primeira Desbalanceada a ser exibida
        syscall
        j saiPrograma #pula para encerrar o programa

    saiLoop: 
        beq $t4, 1, print_des #se $t4 recebeu 1 entao ja estava desbalanceada

        beq $t0, $t1, print_bal #se o numero de abre e fecha parenteses é igual e $t4 !=0 entao esta banceada

        j print_des #se não eram iguais entao esta desbalanceada

    saiPrograma: #encerra o programa
        li $v0,10
        syscall
