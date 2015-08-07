# Segmentos de Memória

Nós já falamos das três secções de um programa em assembly. Essas três secções também representam segmentos que memória.

Curiosamente, se pegarmos no exemplo do 'Hello World' e substituirmos a palavra reservada `section` por `segment`, o programa ira ter o mesmo comportamento.

```asm
segment .text           ; segmento de código
    global _start       ; informa o linker (ld) qual é o ponto
                        ; de entrada

_start:                 ; este é o ponto de entrada
    mov edx, len        ; comprimento da mensagem
    mov ecx, msg        ; mensagem a escrever
    mov ebx, 1          ; instrução para o ficheiro (stdout)
    mov eax, 4          ; numero da system call (sys_write)
    int 0x80            ; chama o kernel

    mov eax,1           ; numero da system call (sys_exit
    int 0x80            ; chama o kernel

segment .data           ; segmento de dados
msg db 'Hello, world!', 0xa     ; esta é a nossa stirng
len equ $ - msg                 ; comprimento da string

```

Quando experimentar o código vai verificar que o que eu disse se confirma:

```text
Hellom world!
```

## Segmentos de Memoria

Um modelo de memória segmentada divide a memória do sistema em grupos de segmentos independentes referenciados por ponteiros localizados nos registos do segmento. Cada segmento é usado para conter um tipo especifico de dados. Um segmento é usado para conter o código de instruções, um outro segmento armazena os elementos de dados, e um terceiro mantêm a *stack* do programa.

À luz da discussão acima, podemos especificar vários segmentos de memória como:

* **Segmento de Dados** - Este é representado pela secção **.data** e **.bss**. A secção .data é usada para declarar a região de memória, onde os elementos de dados são armazenados para o programa. Esta secção não se pode expandir depois dos elementos de dados serem declarados e mantêm-se estática através de toda a execução do programa.
    
    A secção .bss também é secção de memória estática que contem buffers para dados a ser declarados no final do programa. Esre buffer de memória está preenchido a zeros.

* **Segmento de Código** - É representado pela secção **.text**. Esta define a área de memória que armazena as instruções de código. Esta também é uma área de tamanho fixo.

* **Stack** - Este segmento contem os valores de dados passados para as funções e procedimentos dentro do programa.