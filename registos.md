# Registos

As operações do processador envolvem principalmente o processamento de dados. Estes dados podem ser armazenados na memória e acedidos a partir daí. No entanto, a leitura e armazenamento de dados em memória retarda o processador, uma vez que envolve processos complicados de enviar o pedido através do barramento e para a unidade de armazenamento de memória e obter os dados através do mesmo canal.

Para acelerar as operações do processador, o processador inclui alguns locais de armazenamento de memória internos, chamados **registos**.

Os registos armazenam elementos de dados para o processador sem ter que aceder à memória. Um número limitado de registos estão incorporados ao chip do processador.

## Registos do Processador

Existem dez registos de 32-bit e seis de 16-bit na arquitetura IA-32. Os registos estão agrupados tem três categorias:

* Registos de uso geral,
* Registos de controlo, e
* Registos de segmento.

Os registos de processamento geral ainda estão divididos nos seguintes grupos:

* Registos de dados,
* Registos de ponteiro, e
* Registos de índice.

### Registos de Dados

Quatro registos de dados de 32-bit são usados para operações aritméticas, lógicas, e para outras operações. Esses registos podem ser usados de três maneira:

* Como registos completos de 32-bit: `EAX`, `EBX`, `ECX`, `EDX`.
* As metades inferiores dos registos de 32-bit podem ser usados como quatro registos de 16-bit: `AX`, `BX`, `CX`, `DX`.
* As metades mais baixas e mais altas dos registos de 16-bit falamos acima podem ser usados para armazenar dados de 8-bit: `AH`, `AL`, `BH`, `BL`, `CH`, `CL`, `DH` e `DL`.


