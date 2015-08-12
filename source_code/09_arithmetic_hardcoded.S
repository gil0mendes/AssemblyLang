;
; File:     09_arithmetic_hardcoded.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

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
