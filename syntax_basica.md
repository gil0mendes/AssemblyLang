# Syntax Básica

Um programa em assembly pode ser dividido em três secções:

* A secção **data**
* A secção **bss**, e
* A secção **text**.

## A secção *data*

A secção **data** é usada para declarar os dados inicializados ou constantes. Estes dados não mudam de valor durante o tempo de execução.

A syntax para declarar esta secção é:

```asm
section .data
```

## A secção *bss*

A secção **bss** é usada para declarar variaveis. A syntax para a declaração da secção bss é:

```asm
section .bss
```

## A secção *text*

A secção **text** é usada para o manter o código. Esta secção deverá começar por declarar **global _start**, cujo o objetivo é informar o kernel que este é o ponto de entrada para a execução do programa.

A syntax para declarar a secção text é:

```asm
section .text
    global _start
_start:
```

## Comentários

Em assembly os comentários começam com um um ponto e virgula (;). Este pode conter qualquer carater 