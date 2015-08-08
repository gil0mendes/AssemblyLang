;
; File:     02_segment.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

segment .text           ; segmento de código
    global _start       ; informa o linker (ld) qual é o ponto
                        ; de entrada

_start:                 ; este é o ponto de entrada
    mov edx, len        ; comprimento da mensagem
    mov ecx, msg        ; mensagem a escrever
    mov ebx, 1          ; instrução para o ficheiro (stdout)
    mov eax, 4          ; numero da system call (sys_write)
    int 0x80            ; chama o kernel

    mov eax,1           ; numero da system call (sys_exit
    int 0x80            ; chama o kernel

segment .data           ; segmento de dados
msg db 'Hello, world!', 0xa     ; esta é a nossa stirng
len equ $ - msg                 ; comprimento da string
