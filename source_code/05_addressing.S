;
; File:     05_addressing.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

section .text           ; segmento de código
    global _start

_start:                 ; ponto de entrada do programa

    ; imprime o nome 'Vitor Mendes'
    mov eax, 4          ; numero da system call (sys_write)
    mov ebx, 1          ; define o output (stdout)
    mov ecx, name       ; mensagem a ser escrita
    mov edx, len        ; tamanho da mensagem
    int 0x80            ; chama o kernel

    mov [name], dword 'Ariel'       ; Altera o nome para Ariel Mendes

    ; imprime o nome 'Ariel Mendes'
    mov eax, 4          ; numero da system call (sys_write)
    mov ebx, 1          ; define o output (stdout)
    mov ecx, name       ; mensagem a ser escrita
    mov edx, len - 1    ; tamanho da mensagem
    int 0x80            ; chama o kernel

    ; termina o programa
    mov eax, 1
    int 0x80

section .data           ; segmento de dados
    name db 'Vitor Mendes '
    len equ $-name
