;
; File:     11_div_idiv_instructions.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

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
