# EPII - Simple Bank System🏧
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=eclipse&logoColor=white) ![Visual Studio Code](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white) ![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
### 📃 Descrição

O objetivo deste EP é desenvolver um programa que permita ao usuário fazer **depósitos, retiradas e verificação de extrato** nas suas contas a partir do número da conta. Utiliza-se uma única coleção (list ou vector) para armazenar todos os tipos de contas.

A **hierarquia de classes** das contas foi implementado utilizando o conceito de **polimorfismo**.

#### 📁 Estruturação

Elaborar um **sistema de banco** em POO, que trabalhe com **três tipos de contas**:

* Conta Corrente Comum;
* Conta Corrente com Limite;
* Conta Poupança.

#### 📀 Dados Armazenados

Em todos os casos é necessário **guardar**:

* Número da Conta;
* Nome do Correntista;
* Saldo.

Para a **Conta Poupança** é necessário **guardar**:

* Dia do Aniversário da Conta (quando são creditados os juros).

Já para a **Conta com Limite** é necessário guardar:

* Valor do Limite.

As contas também armazenam uma **lista de transações**. Uma **transação**
é definida por:

* Uma data;
* Valor da transação;
* Descrição.

Se o valor for negativo, a transação é considerada um débito (crédito
caso contrário).

#### 📲 Operações

As operações possíveis são: 

* Depósito;
* Retirada;
* Impressão de extrato.

Essas **operações** foram definidas numa **classe abstrata** (interface) denominada **Conta**.

A **operação de depósito** é igual nos três tipos de conta.

A retirada só é diferente na **Conta com Limite**, pois esta admite
que o saldo fique negativo até o limite estabelecido.

Finalmente o **extrato** é diferente para as três:

* Na **Conta Corrente Comum** exibe o número da conta, nome do cliente, transações e o saldo;
* Na **Conta com Limite** imprime também o valor do limite;
* Na **Conta Poupança** imprime também o dia do aniversário.

### 📚 Conteúdo
- Java classes
- Java bytecode files

### 🌐 Motivação
Este Exercício Programa II compõe a nota final da disciplina de **SI300 - Programação Orientada a Objetos I** (1º Semestre 2021) na Faculdade de Tecnologia (FT) UNICAMP.
