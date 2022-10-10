.data
    myArray:
    #.alig 2 #string align
    .space 16 #array de 10 posicoes
.text
main:

    move $t0, $zero #indice do array
    move $t1, $zero #valor a ser colocado no array
    li $t2, 16 #tamanho do array

    loop:
        beq $t0, $t2, saiLoop #quando tiverem o mesmo valor sai do loop
        sw $t1, myArray($t0) #armazena no vetor
        addi $t0, $t0, 4 #incremento indice
        addi $t1, $t1, 1
        j loop #volta no comeco do loop
    
    saiLoop:
        move $t0, $zero
        imprime:
            beq $t0, $t2, saiImpressao #se acabar o vetor sai da impressao
            li $v0, 1 #
            lw $a0, myArray($t0) #
            syscall

            addi $t0, $t0, 4
            j imprime

        saiImpressao:
