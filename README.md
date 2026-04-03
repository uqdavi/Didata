# Didata

**Didata** é um projeto pessoal: uma **linguagem de programação de
domínio específico (DSL)** feita para ser **didática e fácil para
iniciantes brasileiros** na programação.

> Versão atual: **1.1.0**\
> Comandos disponíveis: `escreva` + **variáveis**

------------------------------------------------------------------------

## Sobre o Didata

O Didata permite criar scripts simples em arquivos `.dd` e executá-los
de forma rápida no terminal do Windows.\
O foco do projeto é ensinar conceitos básicos de programação de forma
prática e intuitiva, sem complicações.

------------------------------------------------------------------------

## Características da versão 1.1.0

-   **Comando `escreva`**: imprime texto no terminal

    ``` dd
    escreva <- "Olá, Mundo!"
    ```

-   **Variáveis (inteiras e strings)**:

    ``` dd
    A <- 10
    B <- "Hello"

    escreva <- A
    escreva <- B
    ```

-   **Instalação simplificada (melhorada)**:

    -   Melhor compatibilidade no `.bat`
    -   Usuário **não precisa instalar Java manualmente**

-   **Compatibilidade**: Windows (com JRE embutida)\

-   **Pronto para expandir**: novos comandos serão adicionados nas
    próximas versões

------------------------------------------------------------------------

## Como usar

1.  Baixe o instalador **Didata Setup.exe**.\

2.  Execute o instalador --- ele cria tudo automaticamente:

    -   Instala o Didata\
    -   Adiciona o executável ao PATH do Windows\
    -   Registra associação de arquivos `.dd`\

3.  Crie seu arquivo `.dd` com algum comando Didata.

    Exemplo (`main.dd`):

    ``` dd
    A <- "Olá"
    B <- "Mundo!"

    escreva <- A
    escreva <- B
    ```

4.  Abra o terminal na pasta do arquivo `.dd` e execute:

    ``` bat
    didata main.dd
    ```

5.  O Didata vai ler o arquivo e imprimir o resultado no terminal.

------------------------------------------------------------------------

## Próximos passos

-   Adicionar novos comandos (`leia`, `calcular`, etc.)\
-   Melhorar mensagens de erro e instruções\
-   Suporte a mais tipos de variáveis\
-   Tornar a linguagem mais robusta e intuitiva para iniciantes

------------------------------------------------------------------------

## Observação

Este é um projeto **educacional e experimental**, voltado para
aprendizado e prática.\
O objetivo principal é criar uma **experiência simples e didática** para
quem está começando a programar.

------------------------------------------------------------------------

Feito por **Davi Silva**\
Versão 1.1.0
