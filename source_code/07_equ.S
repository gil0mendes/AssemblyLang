;
; File:     07_equ.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

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
