/* Criação de todas as tabelas da Base de Dados */

CREATE TABLE pessoa
(
	codigo int NOT NULL,
	nome char(20) NOT NULL,
	endereco char(30) NOT NULL,
	telefone char(12) NOT NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE cliente
(
	codigo int NOT NULL,
	rg char(9) NOT NULL,
	dtnasc datetime NOT NULL,
	PRIMARY KEY (codigo),
	UNIQUE (rg),
	FOREIGN KEY (codigo) REFERENCES pessoa
)
GO

CREATE TABLE atendente
(
	codigo int NOT NULL,
	salario money NOT NULL,
	comissao char(20) NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (codigo) REFERENCES pessoa
)
GO

CREATE TABLE livro
(
	codigo int NOT NULL,
	data datetime NOT NULL,
	autor char(50) NOT NULL,
	preco money NOT NULL,
	qtd_estoque int NOT NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE venda
(
	codigo int NOT NULL,
	data datetime NOT NULL,
	cod_cli int NOT NULL,
	rg char(9) NOT NULL,
	cod_aten int NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (cod_cli) REFERENCES cliente(codigo),
	FOREIGN KEY (cod_aten) REFERENCES atendente
)
GO

CREATE INDEX ix_ven_cli
ON venda (cod_cli)
GO

CREATE INDEX ix_ven_aten
ON venda (cod_aten)
GO

CREATE TABLE itemvenda
(
	cod_venda int NOT NULL,
	cod_livro int NOT NULL,
	quantidade int NOT NULL,
	PRIMARY KEY (cod_venda, cod_livro),
	FOREIGN KEY (cod_venda) REFERENCES venda,
	FOREIGN KEY (cod_livro) REFERENCES livro
)
GO

CREATE INDEX ix_itve_li
ON itemvenda (cod_livro)
GO

-- DROP TABLE itemvenda, venda, livro, atendente, cliente, pessoa