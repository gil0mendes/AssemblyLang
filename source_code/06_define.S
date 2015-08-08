;
; File:     06_define.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

section .text           ; segmento de código
    global _start

_start:                 ; ponto de entrada do programa

    mov eax, 4          ; numero da system call (sys_write)
    mov ebx, 1          ; define o output (stdout)
    mov ecx, choise     ; mensagem a ser escrita
    mov edx, 1          ; tamanho da mensagem
    int 0x80            ; chama o kernel

    ; termina o programa
    mov eax, 1
    int 0x80

section .data           ; segmento de dados
    choise DB 'y'
