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




 

