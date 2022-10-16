.data
vetor: .float 2.5 8.3 6.4 3.765 8.123
strN: .asciiz "\n"
.text
.globl main
main:
   li.s $f0, 0.0 # somatorio
   li $t1, 0 # item atual
   li $t3, 5 # total elementos
   la $t2, vetor # carrega endereço do vetor
     
     .data
vetor: .float 2.5 8.3 6.4 3.765 8.123
strN: .asciiz "\n"
.text
.globl main
main:
   li.s $f0, 0.0 # somatorio
   li $t1, 0 # item atual
   li $t3, 5 # total elementos
   la $t2, vetor # carrega endereço do vetor
      
   loop:
      l.s $f1, ($t2) # carrega item atual
      add.s $f0, $f0, $f1 # soma valor atual
      addi $t1, 1 # atualiza indice
      addi $t2, 4 # atualiza posicao memoria
      slt $t0, $t1, $t3 # 1 se nao chegou ultima posicao, 0 c.c.
      bne $t0, 0, loop # deve continuar
      
   addi $v0, $zero, 2 # codigo syscall print_float
   mov.s $f12, $f0 # valor a ser impresso
   syscall
   addi $v0, $zero, 4 # codigo syscall print_str
   la $a0, strN # fim de linha
   syscall
   addi $v0, $zero, 10 # codigo para finalizar programa
   syscall