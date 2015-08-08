;
; File:     03_registers.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

section .text
    global _start       ; informa o linker (ld) qual é o ponto
                        ; de entrada

_start:                 ; este é o ponto de entrada
    mov edx, len        ; comprimento da mensagem
    mov ecx, msg        ; mensagem a escrever
    mov ebx, 1          ; instrução para o ficheiro (stdout)
    mov eax, 4          ; numero da system call (sys_write)
    int 0x80            ; chama o kernel

    mov edx, len        ; comprimento da mensagem
    mov ecx, s2         ; mensagem a escrever
    mov ebx, 1          ; instrução para o ficheiro (stdout)
    mov eax, 4          ; numero da system call (sys_write)
    int 0x80            ; chama o kernel

    mov eax,1           ; numero da system call (sys_exit)
    int 0x80            ; chama o kernel

segment .data           ; segmento de dados
msg db 'Mostra 9 estrelas: ', 0xa       ; esta é a nossa mensagem
len equ $ - msg                         ; contem o tamanho da mensagem
s2 times 9 db '*'                       ; cria uma variavel s2 com 9 estrelas
