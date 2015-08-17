# Instruções Aritméticas

## Instrução INC

A instrução `inc` é usada para incrementar um operando em um. Ele funciona com um único operando que pode ser um registo ou um endereço de memória.

### Syntax

```asm
inc destino
```

O operando pode ser de 8-bit, 16-bit ou 32-bit.

### Exemplo

```asm
inc ebx         ; incrementa um registo de 32-bit
inc dl          ; incrementa um registo de 8-bit
inc [count]     ; incrementa a variável count
```

## Instrução DEC

A instrução `dec` é usada para decrementar um operando em um. Ele funciona com um único operando que pode ser um registo ou um endereço de memória.

### Syntax

A instrução `dec` tem a seguinte *syntax*:

```asm
dec destino
```

O operando pode ser de 8-bit, 16-bit ou 32-bit.

### Exemplo

```asm
segment .data
    count dw 0
    value db 15
    
segment .text
    inc [count]
    dec [value]
    
    mov ebx, count
    inc word [ebx]
    
    mov esi, value
    dec byte [esi]
```

## Instruções ADD e SUB

As instruções `add` e `sub` são usadas para realizar simples operações aritméticas binárias de adição/subtração dados do tamanho em byte, word ou doubleword. Por exemplo, para adicionar ou subtrair 8-bit, 16-bit ou operandos de 32-bit, respetivamente.

### Syntax
As instruções `add` e `sub` têm a seguinte *syntax*:

```asm
add/sub destino, origem
```

Estas duas instruções podem ser usadas em operações do tipo:

* registo para registo
* memoria para registo
* registo para memoria
* registos para dados constantes
* memoria para dados constantes

Contudo, como em outras instruções operações de memoria-para-memoria não são possíveis usando o estas instruções. A operação do `add` ou `sub` podem alterar as *flags* de *overflow* ou de *carry*.

### Exemplo

O próximo exemplo vai pedir dois dígitos ao utilizador, armazena-los nos registos `eax` e `ebx`, respetivamente, soma os dois valores e armazena o resultado na localização de memoria `res` e finalmente mostra o resultado.

```asm
SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .data

    msg1    db  'Insira um digito ', 0xa, 0xd
    len1    equ $ - msg1

    msg2    db  'Insira o segundo digito', 0xa, 0xd
    len2    equ $ - msg2

    msg3    db  'A soma é: '
    len3    equ $ - msg3

section .bss

    num1 resb 2
    num2 resb 2
    res  resb 1

section .text
    global _start

_start:

    ; imprime a string msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; lê o primeiro numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; imprime a string msg2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; lê o segundo numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; move o primeiro numero para o registo eax e o segundo numero para ebx
    ; e subtrai o ascii '0' para converter num numero decimal

    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    ; soma eax e ebx
    add eax, ebx

    ; adiciona '0' para converter de decimal para ascii
    add eax, '0'

    ; armazena a soma na localização de memoria 'res'
    mov [res], eax

    ; imprime a string msg3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; imprime o resultado
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 2
    int 0x80

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
```

Quando o código a cima é compilado e executado, produz o seguinte resultado:

```text
Insira um digito
5
Insira o segundo digito
4
A soma é: 
9
```

**Versão *hardcoded***:

```asm
SYS_EXIT    equ 1
SYS_WRITE   equ 4
STDOUT      equ 1

section .data

    msg1    db  'A soma é: '
    len1    equ $ - msg1

section .bss

    res  resb 1

section .text
    global _start

_start:

    mov eax, 3
    mov ebx, 4

    add eax, ebx

    ; converte de decimal para ascii
    add eax, '0'

    mov [res], eax

    ; imprime a string msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; imprime o resultado
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 2
    int 0x80

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
```

O resultado do código a cima é:

```text
A soma é:
7
```

## As instruções MUL/IMUL

Existem duas instruções para operações de multiplicações com binários. A instrução `MUL` (Multiply) trata de dados sem sinal e a instrução `IMUL` (Integer Multiply) trata de dados com sinal. Ambas as instruções afetam o valores das *flags* *Carry* e *Overflow*.

### Syntax

A *syntax* para as duas instruções é:

```text
mul/imul multiplicador
```

O multiplicando em ambos os casos vai estar num acumulador, dependendo do tamanho do multiplicando e do multiplicador e do produto gerado, dependendo do tamanho dos operandos, serão armazenados em dois registos. A seguir é apresentada uma tabela com os três diferentes casos possíveis usando a instrução `mul`:

| Caso | Cenário |
| -- | -- |
| 1 | **Quando dois bits são multiplicados: ** Se o multiplicando está no registo `al`, e o multiplicador é um byte na memória ou em outros registo. O produto será armazenado em `ax`. Os 8 bits mais significativos do produto são armazenados em `ah` e os 8 menos significativos em `al`. |
| 2 | **Quando duas *words* são multiplicadas: ** O multiplicando é armazenado no registo `ax`, e o multiplicador é uma *word* em memória ou um valor em um outro registo. Por exemplo, ao usar a intrução `mul dx`, você deve armazenadar o multiplicaodr em `dx`e o multiplicando em `ax`. O resultado produzido é uma *doubleword*, e que por isso irá precisar de dois registos. Os bytes mais significativos serão armazenados no registo `dx` e os bytes menos significativos no registo `ax`. |
| 3 | **Quando duas *doublewords* são multiplicadas: ** Quando duas *doublewords* são multiplicadas, o multiplicando deverá estar armazenado em `eax` e o multiplicador deverá estar armazenado em memória ou em outro registo. O produto gerado será armazenado nos registos `edx:eax`.|

### Exemplo

```asm
mov al, 10
mov dl, 25
mul dl
...
mov dl, 0ffh    ; dl = -1
mov al, 0beh    ; al = -66
imul dl
```

### Exemplo II

O próximo exemplo multiplica o valor 3 por 2, e  apresenta o resultado:

```asm
section .text
    global _start

_start:

    ; procede ao calculo de 3*2
    mov al, 3
    mov bl, 2
    mul bl

    ; guarda o resultado da operação em res
    add al, '0'
    mov [res], al

    ; apresenta a mensagem msg
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; apresenta o resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; termina o programa
    mov eax, 1
    int 0x80

section .data

    msg db "O resultado é:", 0xa, 0xd
    len equ $ - msg

section .bss

    res resb 1
```

Quando o código a cima é compilado e executado, ele deve apresentar o seguinte *output*:

```text
O resultado é:
6
```

## As instruções DIV/IDIV

As operações de divisão geram dois elementos, o **quociente** e o **resto**. No caso na multiplicação, o *overflow* não acontece porque são usados dois registos de tamanho duplo para manter o produto. Contudo, no caso da divisão, o *overflow* pode acontecer. O processador gera uma interrupção quando ele ocorre.

A instrução `div` (Divide) é usada para dados sem sinal e a instrução `idiv` (Integer Divide) é usada para dados com sinal.

### Syntax

O formato para o uso destas instruções é o seguinte:

```asm
div/idiv    dividor
```

O dividendo é armazenado no acumulador. Ambas as instruções podem trabalhar com operandos de 8-bit, 16-bit e 32-bit. A operação afeta todas as seis *flags*. A próxima secção explica os três casos da divisão com operadores de diferentes tamanhos:

| Numero | Cenários |
| -- | -- |
| 1 | **Quando o divisor é 1 byte:** É assumido que o dividendo se encontra no registo `ax` (16-bits). Depois da divisão, o quociente encontra-se no registo `al` e o resto vai para o registo `ah`. |
| 2 | **Quando o divisor é 1 *word*: ** É assumido que o dividendo tem 32 bits de cumprimento e encontra-se nos registos `dx:ax`. Os 16 bits mais significativos encontram-se `dx` e os menos significativos encontram-se em `ax`. Depois da divisão, os 16-bit do quociente vão para o registo `ax` e os 16-bit do resto vão para `dx`. |
| 3 | **Quando o divisor é uma *doubleword*: ** Assume-se que o dividendo tem 64 bits de cumprimento e encontra-se em `edx:eax`. Os 32 bits mais significativos encontram-se em `edx` e os 32 bits menos significativos encontram-se em `eax`. Após a divisão, os 32-bit do quociente vão para o registo `eax` e o 32-bit do resto vão para o registo `edx`. |

### Exemplo

O seguinte exemplo divide 8 por 4. O **dividendo 8** é armazenado no **registo de 16-bits ax** e o **divisor 2** é armazenado no **registo de 8-bit bl**.

```asm
section .text
    global _start

_start:

    ; procede ao calculo de 8/4
    mov ax, 8
    mov bl, 4
    div bl

    ; guarda o resultado da operação em res
    add ax, '0'
    mov [res], ax

    ; apresenta a mensagem msg
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; apresenta o resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; termina o programa
    mov eax, 1
    int 0x80

section .data

    msg db "O resultado é:", 0xa, 0xd
    len equ $ - msg

section .bss

    res resb 1
```

O resultado do código a cima será:

```text
O resultado é:
2
```





