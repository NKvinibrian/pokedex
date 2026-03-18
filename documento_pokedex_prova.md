# Desenvolvimento para Dispositivos Móveis  
## Universidade Tuiuti do Paraná  
### Prova prática — 1º Bimestre  

---

## Descrição

Nesta atividade, os alunos deverão desenvolver a lógica de uma Pokédex interativa, inspirada em aplicações do universo Pokémon.  

O objetivo é construir, de forma incremental, um sistema capaz de registrar, organizar e manipular informações sobre pokémons, contemplando funcionalidades como cadastro, evolução, filtragem, simulação de batalhas e geração de estatísticas.  

Ao longo da atividade, serão aplicados conceitos fundamentais de Programação Orientada a Objetos utilizando a linguagem Dart, incluindo:

- classes e objetos  
- encapsulamento  
- herança e sobrescrita de métodos  
- classes abstratas  
- interfaces  
- polimorfismo  
- uso de coleções  
- funções anônimas  

---

## Instruções de Entrega

- O trabalho deverá ser desenvolvido em equipes de 2 a 4 alunos  
- Cada equipe deverá criar um repositório no GitHub para o projeto  
- O arquivo README deve conter a identificação dos integrantes da equipe  
- O link do repositório deverá ser enviado na planilha disponibilizada pelo professor  
- Trabalhos idênticos ou com indícios de cópia terão nota zero  

---

## Questão 1 — Cadastro básico de Pokémon

Crie uma classe `Pokemon` com os seguintes atributos obrigatórios:

- int numero  
- String nome  
- String tipo  
- int nivel  
- int hpAtual  
- int hpMaximo  
- bool capturado  

---

## Questão 2 — Encapsulamento e validação

Implemente:

- subirNivel(int quantidade)  
- receberDano(int dano)  
- curar(int valor)  

---

## Questão 3 — Evolução

Adicione:

- String? proximaEvolucao  
- int nivelEvolucao  

---

## Questão 4 — Pokédex

Crie classe `Pokedex` com:

- adicionarPokemon  
- removerPokemonPorNumero  
- buscarPorNumero  
- listarTodos  

---

## Questão 5 — Filtros

- listarCapturados  
- listarPorTipo  
- listarAcimaDoNivel  
- listarQuePodemEvoluir  

---

## Questão 6 — Herança

- PokemonFogo  
- PokemonAgua  
- PokemonEletrico  

---

## Questão 7 — Habilidades

Classe abstrata `Habilidade` e implementações:

- ChoqueDoTrovao  
- JatoDAgua  
- LancaChamas  

---

## Questão 8 — Batalha

Simular batalha com polimorfismo.

---

## Questão 9 — Interface

Interface `RegistravelNaPokedex`.

---

## Questão 10 — Funções anônimas

Filtros e ordenações.

---

## Questão 11 — Estatísticas

- totalPokemons  
- quantidadePorTipo  
- mediaDeNivel  
- percentualCapturados  

---

## Questão 12 — Desafio final

Simulação completa da Pokédex.

---

## Dinâmica de Avaliação

- Avaliação individual  
- Explicação dos conceitos  
