# Syntax Básica

Um programa em assembly pode ser dividido em três secções:

* A secção **data**
* A secção **bss**, e
* A secção **text**.

## A secção *data*

A secção **data** é usada para declarar os dados inicializados ou constantes. Estes dados não mudam de valor durante o tempo de execução.

A *syntax* para declarar esta secção é:

```asm
section .data
```

## A secção *bss*

A secção **bss** é usada para declarar variáveis. A *syntax* para a declaração da secção bss é:

```asm
section .bss
```

## A secção *text*

A secção **text** é usada para o manter o código. Esta secção deverá começar por declarar **global _start**, cujo o objetivo é informar o *kernel* que este é o ponto de entrada para a execução do programa.

A *syntax* para declarar a secção text é:

```asm
section .text
    global _start
_start:
```

## Comentários

Em *assembly* os comentários começam com um um ponto e virgula (;). Este pode conter qualquer carácter incluindo espaços. Os comentários podem aparecer em um linha, assim:

```asm
; Este programa mostra uma mensagem no ecrã
```

Ou, na mesma linha que uma instrução, como aqui:

```asm
add eax, ebx        ; adiciona ebx a eax
```

## Intruções da Linguagem Assembly

Os programas em assembly consistem em três tipos de intruções:

* Instruções de execução, ou apenas instruções,
* Diretivas do assembler ou pseudo-ops, e
* Macros

As **instruções de execução** ou simplesmente **instruções** dizem ao processador o que fazer. Cada instrução consiste num **código de operação** (opcode). Cada instrução de execução gera uma instrução de linguagem maquina.

As **diretivas do assembler** ou **pseudo-ops** indicam ao assembler vários aspetos do processo de montagem. Estas não são executáveis e não geram instruções de linguagem maquina.

As **macros** são basicamente um mecanismo de substituição de texto.

## Syntax das Instruções

Em assembly as instruções são declaradas uma por linha. Cada instrução segue o seguinte formato:

```asm
[label]     mnemónica    [operandos]    [;comentário]
```

Os campos entre parênteses retos indica que esses são opcionais. Uma instrução básica tem duas partes, a primeira é o nome da instrução (ou a mnemónica), que é para ser executada, e a segunda são os operandos ou os parâmetros do comando.

A baixo encontra um exemplo com algumas instruções em assembly:

```asm
inc COUNT       ; Incrementa a variável em memória COUNT

mov TOTAL, 48   ; Transfere o valor 48 para a variável
                ; em memória TOTAL
                
add ah, bh      ; Adiciona o conteúdo do registo bh no
                ; registo ah
                
and MASK1, 128  ; Realiza uma operação AND entre a variável 
                ; MASK1 e o valor 128
                
and MARKS, 10   ; Adiciona 10 a variável MARKS
mov al, 10      ; Transfere o valor 10 para o registo al
```





