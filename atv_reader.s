.data
    myArray:
    .space 40 #array de 10 posicoes
    str_space: .asciiz " " #espaco em branco a ser printado
.text
main:

    move $t0, $zero #indice do array
    li $t1, 40 #tamanho do array

    loop:
        beq $t0, $t1, saiLoop #quando tiverem o mesmo valor sai do loop
        addi $v0, $zero, 5 #chamada de escrita do numero
        syscall
        sw $v0, myArray($t0) #armazena numero escrito no vetor
        addi $t0, $t0, 4 #incremento indice do vetor
        j loop #volta no comeco do loop
    
    saiLoop:
        addi $v0, $zero, 5 #codigo para leitura de um numero do intervalo
        syscall #chamada do sistema
        add $t2, $v0, $zero #escreve valor em t2

        addi $v0, $zero, 5 #codigo para leitura de um numero do intervalo
        syscall #chamada do sistema
        add $t3, $v0, $zero #escreve valor em t3

        move $t0, $zero #seta valor de t0 para zero
        imprime:
            beq $t0, $t1, saiImpressao #se acabar o vetor sai da impressao
            lw $a0, myArray($t0) #armazena numero da posicao t0 do array em a0

            cond1: 
            slt $t4, $a0, $t2 #compara a0 com t2, se $a0 for menor do que $t2 $t4 recebe 1
            beq $t4, 1, incremento #se t4 for igual a 1 pula para incremento 

            cond2: 
            slt $t4, $t3, $a0 #compara t3 com a0, se $t3 for menor do que $a0 $t4 recebe 1
            beq $t4, 1, incremento #se t4 for igual a 1 pula para incremento 

            print:
            li $v0, 1 
            lw $a0, myArray($t0) #imprimir numero do array na posicao t0
            syscall #chamada do sistema
            
            addi $v0, $zero, 4 #codigo para impressao
            la $a0, str_space #imprimir espaco em branco
            syscall #chamada do sistema

            incremento:
                addi $t0, $t0, 4 #incremento indice
                j imprime #volta para o comeco do laco imprime

        saiImpressao: #codigo para encerrar o programa 
            li $v0,10
            syscall
