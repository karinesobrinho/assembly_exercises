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
    option: .space 4
.text

main:
    move $t0, $zero #indice do array
    move $t1, $zero #auxiliar preenchimento do vetor
    move $t2, $zero 

    loop:
        move $t3, $zero

        addi $v0, $zero, 12 #chamada de escrita da string
        syscall
        add $t2, $v0, $zero #armazena valor escrito

        beq $t2, 's', saiPrograma #quando tiverem o mesmo valor sai do loop

        beq $t2, 'd', desempilha #quando tiverem o mesmo valor sai do loop

        beq $t2, 'e', empilha #quando tiverem o mesmo valor sai do loop

        beq $t2, 'i', imprime #quando tiverem o mesmo valor sai do loop
        j loop

        desempilha:
            sub $t1, $t1, 1
            j saiPrograma

        empilha:
            addi $v0, $zero, 5 #chamada de escrita do numero
            syscall
            sw $v0, myArray($t1) #armazena numero escrito no vetor
            addi $t0, $t0, 4 #incremento indice do vetor
            addi $t1, $t1, 1 #incremento indice do vetor
            j loop #volta no comeco do loop

        imprime:
            j saiPrograma
      
        saiPrograma: #codigo para encerrar o programa 
            li $v0,10
            syscall
