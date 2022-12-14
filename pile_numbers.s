#Escreva um programa que implemente uma pilha de inteiros com até 10 posições em vetor.  
#O programa deve ler os seguintes comandos (um por linha) e executá-los:

#eX: empilha o valor inteiro X;

#d: desempilha o último valor (não precisa fazer nada com o valor em si);

#i: imprime o conteúdo da pilha na ordem em que os itens foram empilhados

#s: termina o programa.


#No comando i, imprima sempre um espaço depois de cada item. 
#Depois de imprimir todos, imprima um fim de linha. 
#Ainda sobre o comando i, se a pilha estiver vazia, não faça nada.


#Exemplo de entrada:
#e1
#e2
#e3
#e4
#i
#d
#i
#d
#e5
#i
#s
#Exemplo de saída:
#1 2 3 4 
#1 2 3 
#1 2 5 

.data
    myArray: .space 40 #array de 10 posicoes
    str_space: .asciiz " " #espaco em branco a ser printado
    str_line: .asciiz "\n" #pula linha a ser printada
.text

main:
    move $t0, $zero #indice do array
    move $t1, $zero #auxiliar preenchimento do vetor
    move $t2, $zero #auxilar para armazenar o que o user digita

    loop:
        move $t1, $zero #seta auxiliar t1
        
        addi $v0, $zero, 12 #chamada de escrita da string
        syscall #chamada do sistema
        add $t2, $v0, $zero #armazena valor escrito

        beq $t2, 's', saiPrograma #quando tiverem o mesmo valor sai do loop para saiPrograma

        beq $t2, 'd', desempilha #quando tiverem o mesmo valor sai do loop para desempilha

        beq $t2, 'e', empilha #quando tiverem o mesmo valor sai do loop para empilha

        beq $t2, 'i', imprime #quando tiverem o mesmo valor sai do loop para imprime
        j loop

        desempilha:
            sub $t0, $t0, 4 #subtrai tamanho do vetor digitado
            j loop #volta no comeco do loop

        empilha:
            addi $v0, $zero, 5 #chamada de escrita do numero
            syscall #chamada do sistema
            sw $v0, myArray($t0) #armazena numero escrito no vetor
            addi $t0, $t0, 4 #incremento indice do vetor
            j loop #volta no comeco do loop

        imprime:
            beq $t0, $t1, loop #se acabar o vetor sai da impressao e volta para loop

            li $v0, 1 #codigo para impressao de inteiro
            lw $a0, myArray($t1) #imprimir numero do array na posicao t0
            syscall #chamada do sistema
            
            addi $v0, $zero, 4 #codigo para impressao
            la $a0, str_space #imprimir espaco em branco
            syscall #chamada do sistema

            addi $t1, $t1, 4 #incrementa auxiliar

            beq $t0, $t1, imprime_linha #se acabou o vetor vai para imprime pula linha
            j imprime #volta no comeco do imprime

        imprime_linha:
            addi $v0, $zero, 4 #codigo para impressao
            la $a0, str_line #imprimir pula linha 
            syscall #chamada do sistema
            j loop #volta no comeco do loop
      
        saiPrograma: #codigo para encerrar o programa 
            li $v0,10
            syscall
