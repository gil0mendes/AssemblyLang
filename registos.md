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

![Registos](./imgs/registos.jpg)

Alguns destes registos têm usos específicos em algumas operações aritméticas.

**O AX é o acumulador primário**; Ele é usado no input/output na maioria das operações aritméticas. Por exemplo, na operação de multiplicação, um operando é armazenado no registo EAX ou AX ou AL de acordo com o tamanho do operando.

**O BX é conhecido como o registo de base**, uma vez que pode ser utilizado endereçar índices.

**O CX é conhecido como o registo de contagem**, tanto o ECX como o CX, eles armazenam o contador em operações iterativas.

**O DX é conhecido como o registo de dados**. Também é utilizado em operações de input/output. Ele também é usado com o registo AX juntamente com o DX para operações de multiplicação e divisão envolvendo grandes valores.

### Registos Ponteiros

Os registos ponteiros são de registos de 32-bit EIP, ESP e EBP e os seus correspondentes em 16-bit são IP, SP e BP. Existem três categorias de registos apontadores:

* **Instruction Pointer (IP)** - Este registo contem o 16-bit do endereço de offset (deslocamento) da próxima instrução a ser executada. O IP em associação com o registo CS (como CS:IP) dá o endereço completo da instrução no segmento de código.

* **Stack Pointer (SP)** - O registo SP de 16-bit fornece o valor de deslocamento dentro da *stack* do programa. O SP em associação com o registo SS (SS:SP) refere-se a posição atual dos dados ou do endereço no interior da *stack* do programa.

* **Base Pointer (BP)** - O registo de 16-bit BP ajuda principalmente a referenciar as variáveis passados por parâmetro a uma sub-rotina. O Endereço no registo SS combinado com o *offset* em BP obtém-se a localização do parâmetro. O BP também pode ser combinado com o DI e o SI como base para operações de endereçamento especiais.

### Registos de Índice

Os registos de índice de 32-bit são o ESI e o EDI, os seus 16-bit mais à direita são o SI e o DI. O Si e o DI, são usados endereçamento indexado e às vezes também são usados na adição e subtração. Há dois conjuntos de ponteiros de índice:

* **Source Index (SI)** - Ele é usado como índice da fonte de dados a copiar.

* **Destination Index (DI)** - Ele é usado como índice do destino dos dados a copiar.
* 

## Registos de Controlo

Quando se combina os 32-bit dos registos de ponteiros com 32-bit dos registos de *flags* obtém-se os registos de controlo.

Muitas instruções envolvem comparações e cálculos matemáticos, alteração de estados das *flags* e outras instruções condicionais testam os valores do estado dessas *flags* para direcionar o fluxo de execução para outro local.

As *flags* mais comuns são:

* **Overflow Flag (OF)** - Ela indica se ocorreu um *overflow* de um bit mais significativo dos dados após uma dada operação aritmética.





