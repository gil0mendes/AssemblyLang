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


 

