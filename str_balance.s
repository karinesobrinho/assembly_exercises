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
    move $t3, $zero

    loop: 
        addi $v0, $zero, 12 #chamada de escrita 
        syscall
        add $t3, $v0, $zero #armazena numero escrito no vetor
        
        beq $t3, '.', saiLoop #quando tiverem o mesmo valor sai do loop

        beq $t3, '(', inc_abre
        beq $t3, ')', inc_fecha
        j loop #volta no comeco do loop

    inc_abre:
        addi $t0, 1
        j loop

    inc_fecha:
        addi $t1, 1

        slt $t4, $t0, $t1 #se $t0 for menor do que $t1 $t4 recebe 1
        
        j loop

    print_bal:
        addi $v0, $zero, 4 # codigo syscall print_str
        la $a0, str1 # primeira string a ser exibida
        syscall
        j saiPrograma

    print_des:
        addi $v0, $zero, 4 # codigo syscall print_str
        la $a0, str2 # primeira string a ser exibida
        syscall
        j saiPrograma

    saiLoop: #codigo para encerrar o programa 
        beq $t4, 1, print_des

        beq $t0, $t1, print_bal

        j print_des

    saiPrograma:
        li $v0,10
        syscall
