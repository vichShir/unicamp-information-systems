# SI702 - Inteligência Artificial

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white) 

### 📃 Descrição

Este repositório contém o trabalho final desenvolvido na disciplina de Inteligência Artificial na Unicamp sobre aplicação de diferentes **algoritmos de busca** no problema de **viagem interplanetária**. O algoritmo de busca heurística **A* (A star)** foi implementado para testar diferentes heurísticas a fim de observar determinados comportamentos.

### 😵 Problema

O problema consiste em encontrar o melhor caminho com o menor custo possível partindo de um dos 8 planetas do Sistema Solar até determinado outro do mesmo.

Para resolver o problema, empregamos o uso de diferentes algoritmos de busca, tanto cegas quanto heurísticas:

* Busca cega em amplitude
* Busca cega em profundidade
* Busca heurística Greedy Best-First
* Busca heurística A*

### 🎲 Entendendo a estrutura dos dados

A implementação do algoritmo A* considera 2 estruturas de dados para a construção do grafo do espaço de estados e para as heurísticas (informações adicionais), respectivamente.

**grafo.json:**

Contém dados das distâncias reais dos planetas no Sistema Solar para construção do grafo.

**heuristicas.csv:**

Contém dados dos valores dos diferentes cenários de heurísticas utilizadas considerando o problema de ir do planeta Terra até o planeta Júpiter.

### 🌐 Motivação

O trabalho compõem a nota final da disciplina de **SI702 - Inteligência Artificial** (1º Semestre 2022) na Faculdade de Tecnologia (FT) UNICAMP.

### ✏️ Equipe

- Leonardo Polizel Martins
- Matheus Eduardo da Silva
- Renan de Oliveira Ferretti
- Victor Yukio Shirasuna (vichShir)

### 📖 Referências

* MARTINS, SILVA, FERRETI, SHIRASUNA. **APLICAÇÃO DE DIFERENTES ALGORITMOS DE BUSCA EM VIAGEM INTERPLANETÁRIA**.  2022.  Disponível em: https://drive.google.com/file/d/1IzFzWvRcq-1VV1VP27Ask_nNI7sIDmz5/view?usp=sharing.