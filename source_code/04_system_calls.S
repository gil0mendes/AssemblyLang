;
; File:     04_system_calls.S
; Author:   Gil Mendes <gil00mendes@gmail.com>
;
; Version:  1
;

section .data                                   ; segmento de dados
    userMsg db 'Por favor, insira um numero: '  ; pede ao utilizador para inserir um numero
    lenUserMsg equ $-userMsg                    ; comprimento da mensagem
    dispMsg db 'Voce inseriu: '
    lenDispMsg equ $-dispMsg

section .bss            ; dados não inicializados
    num resb 5

section .text           ; segmento de código
    global _start

_start:                 ; ponto de entrada do programa
    ; mostra a mensagem userMsg
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 0x80

    ; lê e armazena um input do utilizador
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5          ; 5 bytes (numérico, 1 para o sinal) da informação
    int 80h

    ; Imprime a mensagem dispMsg
    mov eax, 4
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDispMsg
    int 0x80

    ; Imprime o numero inserido
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80

    ; termina o programa
    mov eax, 1
    mov ebx, 0
    int 0x80
