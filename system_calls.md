# System Calls

As system calls (ou chamadas do sistema) são APIs para criar uma interface entre o *user space* (espaço onde o utilizador tem permissão para correr os seus programas) e o *kernel space* (espaço onde o sistema operativo correr os seus programas que necessitam de um nível de permissão superior). Nos já usamos algumas *system calls* tais como o `sys_write` e o `sys_exit`, para escrever no ecrã e terminar o programa, respetivamente.

## System Calls do Linux

Nos nossos exemplos estamos a fazer uso das *system calls* do Linux. Para fazer uso das *system calls* do Linux nos nossos programas é preciso seguir as seguintes quatro etapas:

* Colocar o valor da *system call* no registo EAX.
* Armazenar os argumentos nos registos EBX, ECX, etc.
* Chamar a interrupção 80h.
* O resultado, por norma, é retornado para o registo EAX.

Existem seis registos que são usados para armazenar os argumentos das *system calls* usadas. Eles são: `EBX`, `ECX`, `ESI`, `EDI` e `EBP`. Esses registos recebem os argumentos de forma consecutiva, a começar pelo EBX. Se houver mais do que seis argumentos, então a localização de memória do primeiro argumento é armazenado no registo EBX.

O seguinte *snippet* mostra como deve ser feito o uso da *system call* `sys_exit`:

```asm
mov     eax, 1          ; numero da system call (sys_exit)
int     0x80            ; chama o kernel
```

O próximo *snippet* mostra o uso da *system call* `sys_write`:

```asm
mov     edx, 4          ; comprimento da mensagem
mov     ecx, msg        ; mensagem a ser escrita
mov     ebx, 1          ; especifica a saída (stdout)
mov     eax, 4          ; numero da system call (sys_write)
int     0x80            ; chama o kernel
```

Todas as *system calls* estão listadas em `/usr/include/asm/unistd.h`, juntamente com os seus números (o valor a colocar em EAX antes de chamar a interrupção 80h).

A tabela a baixo mostra algumas dessas *system calls* que são usadas neste livro:

| %eax | Nome | %ebx | %ecx | edx | esx | edi |
| -- | -- | -- | -- | -- | -- | -- |
| 1 | sys_exit | int | - | - | - | - |
| 2 | sys_fork | struct pt_regs | - | - | - | - |
| 3 | sys_read | unsigned int | char * | size_t | - | - |
| 4 | sys_write | unsigned int | const char * | size_t | - | - |
| 5 | sys_open | const char * | int | int | - | - |
| 6 | sys_close | unsigned int | - | - | - | - |




