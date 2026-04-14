# Didata 📘

**Didata** é um projeto pessoal: uma **linguagem de programação de domínio específico (DSL)** feita para ser **didática e fácil para iniciantes brasileiros** na programação.

> **Versão atual:** 2.1.0  
> **Arquivos:** `.dd`  
> **Plataforma:** Windows (com JRE embutida)

---

## Sobre o Didata

O Didata permite que você crie scripts simples em arquivos `.dd` e execute-os de forma rápida no terminal do Windows. O foco do projeto é ensinar conceitos básicos de programação de forma prática e intuitiva, sem complicações.

---

## Como instalar

1. Baixe o instalador **Didata Setup.exe** na seção de [Releases](../../releases).
2. Execute o instalador — ele cria tudo automaticamente:
   - Instala o Didata
   - Adiciona o executável ao PATH do Windows
   - Registra a associação de arquivos `.dd`
3. Pronto! Abra o terminal e já pode usar o comando `didata`.

---

## Como usar

Crie um arquivo com a extensão `.dd` e escreva seu código Didata. Para executá-lo, abra o terminal na pasta do arquivo e rode:

```bat
didata meu_arquivo.dd
```

---

## Referência da Linguagem

### Tipos de Dados

O Didata possui inferência automática de tipos. O tipo de uma variável é determinado pelo valor atribuído a ela.

| Tipo | Descrição | Exemplo de valor |
|------|-----------|-----------------|
| `texto` | Cadeia de caracteres | `"Olá, Mundo!"` |
| `inteiro` | Número inteiro | `42` |
| `double` | Número decimal | `3.14` |
| `float` | Número decimal (sufixo `f` ou `F`) | `3.14f` |
| `booleano` | Valor lógico | `verdadeiro`, `falso` |
| `caractere` | Caractere individual | `'a'` |

---

### Comentários

Linhas iniciadas com `//` ou `#` são ignoradas pelo interpretador e servem para documentar o código.

```didata
// Isto é um comentário
# Isto também é um comentário

nome <- "João" // comentário inline não é suportado
```

---

### Diretivas Especiais

#### `#sem-logs`

Desativa os logs de execução detalhados. Quando utilizada, apenas a saída dos comandos `escreva` é exibida no terminal.

```didata
#sem-logs
escreva <- "Apenas este texto aparecerá"
```

> Ideal para quando você quer ver somente o resultado final, sem mensagens de depuração.

---

### Variáveis

Use o operador `<-` para criar e atribuir valores a variáveis. O tipo é inferido automaticamente a partir do valor.

**Sintaxe:**
```didata
nome_variavel <- valor
```

**Exemplos:**

```didata
nome   <- "Maria"       // texto
idade  <- 25            // inteiro
preco  <- 19.99         // double
nota   <- 8.5f          // float
ativo  <- verdadeiro    // booleano
```

---

### Saída (Output)

#### `escreva`

Exibe texto, valores ou resultados de expressões no terminal.

**Sintaxes disponíveis:**

```didata
escreva <- "Texto literal"   // com seta (recomendado)
escreva("Texto literal")     // com parênteses

escreva <- nome              // valor de uma variável
escreva <- a + b             // resultado de uma expressão
```

**Exemplos:**

```didata
escreva <- "Olá, Mundo!"
escreva <- nome
escreva <- x + y
```

---

### Entrada (Input)

#### `leia` / `ler`

Lê um valor digitado pelo usuário e armazena em uma variável. O tipo é inferido automaticamente.

> `ler` é um alias de `leia` — ambos fazem a mesma coisa.

**Sintaxe:**
```didata
leia nome_variavel
ler nome_variavel
```

**Exemplos:**

```didata
leia nome
ler idade
```

**Parse automático de tipos:**

| O usuário digita | Tipo inferido |
|-----------------|---------------|
| `verdadeiro`    | Booleano      |
| `falso`         | Booleano      |
| `42`            | Inteiro       |
| `3.14`          | Double        |
| `qualquer texto`| Texto         |

---

### Operações Aritméticas

Você pode realizar operações aritméticas direto na atribuição de variáveis.

**Sintaxe:**
```didata
resultado <- operando1 operador operando2
```

**Operadores disponíveis:**

| Operador | Operação       | Exemplo       |
|----------|----------------|---------------|
| `+`      | Soma           | `a + b`       |
| `-`      | Subtração      | `x - 5`       |
| `*`      | Multiplicação  | `3 * y`       |
| `/`      | Divisão        | `total / 2`   |

**Regras de tipo do resultado:**

- Se ambos os operandos forem inteiros e a operação **não for divisão** → resultado é `inteiro`
- Em qualquer outro caso → resultado é `double`
- **Divisão por zero** → retorna `0` (sem erro)

**Exemplos:**

```didata
a <- 10
b <- 3

soma           <- a + b     // 13 (inteiro)
subtracao      <- a - b     // 7  (inteiro)
multiplicacao  <- a * b     // 30 (inteiro)
divisao        <- a / b     // 3.333... (double)

escreva <- soma
escreva <- divisao
```

---

### Estruturas Condicionais

#### `se ... entao ... senao ... fim`

Executa um bloco de código dependendo de uma condição. O bloco `senao` é opcional.

**Sintaxe:**

```didata
se variavel operador valor entao
    // código se a condição for verdadeira
senao
    // código se a condição for falsa (opcional)
fim
```

**Operadores de comparação:**

| Operador | Significado      | Exemplo             |
|----------|------------------|---------------------|
| `>`      | Maior que        | `se x > 5 entao`   |
| `<`      | Menor que        | `se x < 10 entao`  |
| `==`     | Igual a          | `se nome == "Ana"` |
| `!=`     | Diferente de     | `se ativo != falso`|
| `>=`     | Maior ou igual   | `se idade >= 18`   |
| `<=`     | Menor ou igual   | `se preco <= 100`  |

**Tipos suportados na comparação:** números, texto, booleanos e caracteres.

**Exemplo simples:**

```didata
idade <- 18

se idade >= 18 entao
    escreva <- "Maior de idade"
senao
    escreva <- "Menor de idade"
fim
```

**Exemplo sem `senao`:**

```didata
nota <- 8

se nota >= 7 entao
    escreva <- "Aprovado!"
fim
```

---

#### `senao se` — Condições encadeadas

Use `senao se` para verificar múltiplas condições em sequência, sem precisar aninhar vários `se`. Um único `fim` fecha toda a cadeia.

**Sintaxe:**

```didata
se variavel operador valor entao
    // primeiro bloco
senao se variavel operador valor entao
    // segundo bloco
senao se variavel operador valor entao
    // terceiro bloco (pode ter quantos precisar)
senao
    // bloco final, caso nenhuma condição seja verdadeira (opcional)
fim
```

**Exemplo — classificação de nota:**

```didata
nota <- 7

se nota >= 9 entao
    escreva <- "Ótimo"
senao se nota >= 7 entao
    escreva <- "Bom"
senao se nota >= 6 entao
    escreva <- "Aprovado"
senao
    escreva <- "Reprovado"
fim
```

**Exemplo — sem bloco `senao` final:**

```didata
mes <- 3

se mes == 1 entao
    escreva <- "Janeiro"
senao se mes == 2 entao
    escreva <- "Fevereiro"
senao se mes == 3 entao
    escreva <- "Março"
fim
```

> **Regra:** apenas o primeiro bloco cuja condição for verdadeira é executado. Os demais são ignorados.

---

## Exemplo Completo

```didata
#sem-logs

// Atribuição de variáveis
nome   <- "Maria"
idade  <- 25
ativo  <- verdadeiro
preco  <- 19.99

// Operações aritméticas
dobro <- idade * 2

// Saída no terminal
escreva <- "Olá, "
escreva <- nome
escreva <- idade
escreva(ativo)
escreva <- dobro

// Estrutura condicional com senao se
se idade >= 18 entao
    escreva <- "Maior de idade"
senao se idade >= 16 entao
    escreva <- "Quase lá"
senao
    escreva <- "Menor de idade"
fim

// Leitura de entrada do usuário
escreva <- "Digite seu nome:"
leia <- resposta
escreva <- resposta
```

---

## Limitações Atuais

Os seguintes recursos **ainda não estão disponíveis** nesta versão:

| Recurso | Status |
|---------|--------|
| Laços de repetição (`enquanto`, `para`) | ❌ Não implementado |
| Funções (definição e chamada) | ❌ Não implementado |
| Operadores lógicos (`e`, `ou`, `nao`) | ❌ Não implementado |
| Arrays / Listas | ❌ Não implementado |
| Retorno de valores (`retorne`) | ❌ Não implementado |

---

## Sobre o Projeto

Este é um projeto **educacional e experimental**, voltado para aprendizado e prática. O objetivo principal é criar uma **experiência simples e didática** para quem está começando a programar.

Feito por **Davi Silva** — Versão 2.1.0