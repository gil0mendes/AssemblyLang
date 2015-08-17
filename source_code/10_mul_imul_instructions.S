;
; File:     10_mul_imul_instructions.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

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
