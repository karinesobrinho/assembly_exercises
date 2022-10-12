.data
    myArray:
    #.alig 2 #string align
    .space 40 #array de 10 posicoes
.text
main:

    move $t0, $zero #indice do array
    #move $t1, $zero #valor a ser colocado no array
    li $t2, 40 #tamanho do array
    li $t3, 5
    li $t4, 8

    loop:
        beq $t0, $t2, saiLoop #quando tiverem o mesmo valor sai do loop
        addi $v0, $zero, 5
        syscall
        sw $v0, myArray($t0) #armazena no vetor
        addi $t0, $t0, 4 #incremento indice
        addi $t1, $t1, 1
        j loop #volta no comeco do loop
    
    saiLoop:
        move $t0, $zero
        imprime:
            beq $t0, $t2, saiImpressao #se acabar o vetor sai da impressao
            lw $a0, myArray($t0)

            cond2: 
            slt $t5, $a0, $t3
            beq $t5, 1, incremento 

            cond1: 
            slt $t5, $t4, $a0
            beq $t5, 1, incremento 

            print:
            li $v0, 1 #
            lw $a0, myArray($t0) #
            syscall
            
            incremento:
                addi $t0, $t0, 4
                j imprime

        saiImpressao:
