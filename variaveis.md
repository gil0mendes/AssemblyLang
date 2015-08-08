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

