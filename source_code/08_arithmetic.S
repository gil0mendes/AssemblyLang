;
; File:     08_arithmetic.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

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
