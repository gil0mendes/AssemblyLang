# Modos de Endereçamento

Grande parte das instruções da linguagem assembly precisão de operandos para serem processadas. Um operando que seja um endereço fornece a localização dos dados a serem processados estão armazenados. Algumas instruções não precisão de operandos, outras precisam de um , dois ou por vezes três.

Quando uma instrução precisa de dois operandos, o primeiro operando geralmente é o destino, o qual contém os dados num registo de memória ou localização e o segundo operando é a fonte. A fonte contém os dados a serem entregues (endereçamento imediato) ou o endereço (no registo ou memória) dos dados. Geralmente, a fonte dos dados permanece inalterado após a operação.

Existem três modos básicos de endereçamento, são eles:

* Endereçamento de registo
* Endereçamento imediato
* Endereçamento de memória

## Endereçamento de Registo

Neste modo de endereçamento, o registo contem o operando. Dependendo da instrução, o registo pode ser o primeiro operando, o segundos ou ambos.

Por exemplo:

```asm
mov dx, tax_rate    ; o primeiro operando é um registo
mov count, cx       ; o segundos operando é um registo
mov eax, ebx        ; ambos os operandos são registos
```

O processamento de dados entre registos não envolve memoria, por isso isto proporciona um processamento rápido dos dados.

## Endereçamento Imediato

Um operando de endereçamento imediato é um valor constante ou expressão. Quando uma instrução com dois operandos usa endereçamento imediato, o primeiro operando pode ser um registo ou uma localização de memória, o segundo operando é uma constante. O primeiro operando define o comprimento dos dados.

Por exemplo:

```asm
byte_value db 150   ; define um valor em bytes
word_value dw 300   ; define um valor em words
add byte_value, 65  ; o operando imediato é adicionado
mov ax, 45h         ; a constante 45h é transferida para ax
```

## Endereçamento Direto de Memoria

Quando os operandos são especificados no modo de endereçamento de memória, acesso direto à memória principal, geralmente o segmento de dados é necessário. Este tipo de endereçamento resulta em operações de processamento de dados lentas. Para encontrar a localização em memoria dos dados, nos precisamos do endereço do inicio do segmento, que é tipicamente encontrado no registo DS e o valor de *offset*. Este valor de *offset* é tipicamente chamado de **effective address** (ou endereço efetivo).

No modo de endereçamento direto, o valor do *offset* é especificado diretamente como parte da instrução, geralmente indica pelo nome da variável. O assembler calcula o valor do *offset* e mantém uma tabela de símbolos, que armazena os valores de *offset* de todas as variáveis utilizadas no programa.

No endereçamento direto de memória, um dos operandos refere-se à localização de memória e o outro refere-se ao registo.

Por exemplo:

```asm
add byte_value, dl      ; adiciona o valor do registo na localização de memória
mov bx, word_value      ; os dados da memória são adicionados ao registo
```

## Endereçamento Direto com Deslocamento

Este modo de endereçamento usa operações aritméticas para modificar um endereço. Por exemplo, considere as seguintes instruções que definem tabelas de dados:

```asm
byte_table db 14, 15, 22, 45        ; tabela de bytes
word_table dw 134, 345, 564, 123    ; tabela de words
```

As próximas operações acedem aos dados que estão na tabelas em memória para registos:

```asm
mov cl, byte_table[2]       ; obtém o terceiro elemento de byte_table
mov cl, byte_table + 2      ; obtém o terceiro elemento de byte_table
mov cx, word_table[3]       ; obtém o quarto elemento de word_table
mov cx, word_table + 3      ; obtem o quarto elemento de word_table
```

## Endereçamento Indireto de Memória

Este modo de endereçamento utilizada a capacidade do computador endereçar `Segment:Offset`. Geralmente, os registos de base EBX EBP (ou BX, BP) e os registo de índice (DI, SI), codificados entre parênteses retos referenciam a memória.

O endereçamento indireto é geralmente usado para variáveis que contenham diversos elementos, como *arrays*. O endereço do *array* é armazenado no registo EBX.

O *snippet* a baixo mostra como aceder a diferentes elementos de uma variável:

```asm
my_table times 10 dw 0      ; aloca 10 words (2 bytes) e cada uma é inicializada a 0
mov ebx, [my_table]         ; copia o valor do endereço de my_table para ebx
mov [ebx], 110              ; my_table[0] = 110
add ebx, 2                  ; ebx = ebx +2
mov [ebx], 123              ; my_table[1] = 123
```

## Instrução MOV

Nos já usamos desde os primeiros exemplos a instrução `mov`, esta instrução é usada para mover dados de um espaço de armazenamento para um outro. A instrução `mov` recebe dois operandos.

### Syntax

A *syntax* da instrução mov é:

```asm
mov destino, origem
```

A instrução `mov`pode ser uma das seguintes 5 formas:

```asm
mov registo, registo
mov registo, imediato
mov memoria, imediato
mov registo, memoria
mov memoria, registo
```
Tenha em atenção que:

* Ambos os operandos do `mov` devém ser do mesmo mesmo tamanho
* O valor da origem mantêm-se inalterado

A instrução `mov` por vezes causa ambiguidade. Por exemplo, olhe para a seguinte declaração:

```asm
mov ebx, [my_table]         ; endereço efetivo de my_table em ebx
mov [ebx], 110              ; my_table[0] = 110
```

Não é claro se você quer mover um byte equivalente ou uma word do valor 110. Em alguns casos, é aconselhável usar um especificador de tipo.

Na tabela a baixo estão expostos os tipos mais comuns:

| Especificação do Tipo | Bytes endereçados |
| -- | -- |
| BYTE | 1 |
| WORD | 2 |
| DWORW | 4 |
| QWROD | 8 |
| TBYTE | 10 |

## Exemplo

O seguinte programa ilustra alguns conceitos discutidos a cima. Ele armazena um nome 'Vitor Mendes' na secção de dados da memória, depois altera o valor para outro nome 'Ariel Mendes' de forma programática e mostra ambos os nomes.

```asm
section .text           ; segmento de código
    global _start

_start:                 ; ponto de entrada do programa

    ; imprime o nome 'Vitor Mendes'
    mov eax, 4          ; numero da system call (sys_write)
    mov ebx, 1          ; define o output (stdout)
    mov ecx, name       ; messagem a ser escrita
    mov edx, len        ; tamanho da mensagem
    int 0x80            ; chama o kernel

    mov [name], dword 'Ariel'       ; Altera o nome para Ariel Mendes

    ; imprime o nome 'Ariel Mendes'
    mov eax, 4          ; numero da system call (sys_write)
    mov ebx, 1          ; define o output (stdout)
    mov ecx, name       ; messagem a ser escrita
    mov edx, len - 1    ; tamanho da mensagem
    int 0x80            ; chama o kernel

    ; termina o programa
    mov eax, 1
    int 0x80

section .data           ; segmento de dados
    name db 'Vitor Mendes '
    len equ $-name
```

O resultado será:

```text
Vitor Mendes Ariel Mendes
```

 

