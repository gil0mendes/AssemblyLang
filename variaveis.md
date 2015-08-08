# Variáveis

O NASM fornece varias diretivas para reservar espaço de armazenamento para variáveis. Essas diretivas permitem reservar e/ou inicializar um ou mais bytes.

## Alocar espaço para os dados iniciais

A *syntax* para inicializar dados é:

```text
[nome-da-variável]  diretiva-de-definição   valor-inicial   [, valor-inicial]...
```

Quando, o nome-da-variável identifica o espaço de armazenamento. O assembler associa um valor de *offset* para cada nome de variável definida no segmento de dados.

Aqui estão cinco formas básicas de definir uma variável:

| Diretiva | Propósito | Espaço de Armazenamento |
| -- | -- | -- |
| DB | Define um Byte | aloca 1 byte |
| DW | Define uma Word | aloca 2 bytes |
| DD | Define uma Doubleword | aloca 4 bytes |
| DQ | Define uma Quadword | aloca 8 bytes |
| DT | Define Dez Bytes | aloca 10 bytes |

A baixo estão os exemplos do uso das diretivas:

```asm
choice          DB      'y'
number          DW      12345
neg_number      DW      -12345
big_number      DQ      123456789
real_number1    DD      1.234
real_number2    DQ      123.456
```

Tenha em atenção:

* Cada byte é armazenado como um valor ASCII em hexadecimal.
* Cada valor decimal é automaticamente convertido para o valor equivalente em binário de 16-bit e armazenado como um numero hexadecimal.
* O processador uso *litte-endian* na ordenação dos bytes.
* Números negativos são convertidos para o seu complemento a 2.
* Números de ponto flutuante, curtos e longos, são representados usando 32 ou 64 bits, respetivamente.

O programa a baixo mostra o uso da diretiva de definição:

```asm
section .text           ; segmento de código
    global _start

_start:                 ; ponto de entrada do programa

    mov eax, 4          ; numero da system call (sys_write)
    mov ebx, 1          ; define o output (stdout)
    mov ecx, choise     ; mensagem a ser escrita
    mov edx, 1          ; tamanho da mensagem
    int 0x80            ; chama o kernel

    ; termina o programa
    mov eax, 1
    int 0x80

section .data           ; segmento de dados
    choise DB 'y'
```

