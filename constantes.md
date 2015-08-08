# Constantes

Existem diferentes diretivas para definir constantes em NASM. Nos até agora usamos uma das três formas, a diretiva `equ`. Neste capitulo vamos falar das três formas:

* EQU
* %assign
* $define

## A diretiva EQU

A diretiva `equ` é usada para definir constantes. A *syntax* é a seguinte:

```text
NOME_DA_CONSTANTE EQU EXPRESSÃO
```

Por exemplo:

```asm
TOTAL_STUDENTS equ 50
```

Você pode usar a constante no seu código tipo:

```asm
mov ecx, TOTAL_STUDENTS
cmp eax, TOTAL_STUDENTS
```

O operando da definição do `equ` pode ser uma expressão:

```asm
LENGTH  equ 20
WIDTH   equ 10
AREA    equ length * width
```

A última linha iria definir a `AREA` como 200.

## Exemplo

A baixo podemos ver uma ilustração do uso da diretiva `equ`.

```asm
SYS_EXIT    equ 1
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .text           ; segmento de código
    global _start

_start:                 ; ponto de entrada do programa

    ; imprime a string msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; imprime a string msg2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; imprime a string msg3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; termina o programa
    mov eax, SYS_EXIT
    int 0x80

section .data           ; segmento de dados
    msg1    db  'Olá Geeks!', 0xa, 0xd
    len1    equ $ - msg1

    msg2    db  'Bem-vindos ao mundo da,', 0xa, 0xd
    len2    equ $ - msg2

    msg3    db  'programação em assembly para Linux! '
    len3    equ $ - msg3
```

O *output* do código a cima é:

```text
Olá Geeks!
Bem-vindos ao mundo da,
programação em assembly para Linux!
```

## A Diretiva %assign

A diretiva `%assign` pode ser usada para definir constantes numéricas tal como a diretiva `equ`. Esta diretiva permite ser redefinida e ela também é *case-sensitive*. 

```asm
%assign TOTAL 20
```

## A Diretiva %define

A diretiva `%define` permite definir constantes numéricas ou *strings*. Esta directiva é semelhante ao `#define` da linguagem C. Por exemplo, você pode definir uma constante PTR tipo:

```asm
%define PTR [EBP+4]
```

Esta diretiva também permite ser redefinida e também é *case-sensitive*.
