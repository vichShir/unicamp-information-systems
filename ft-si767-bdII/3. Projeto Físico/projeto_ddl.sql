/**
 * ST767 – Banco de Dados II
 * Projeto - Parte 2
 * 
 * Caio Pereira Masseu
 * Victor Yukio Shirasuna
 * */

/* DDL */
/* Criação de todas as tabelas da Base de Dados */
CREATE TABLE pessoa 
(
	codpessoa INT NOT NULL,
	nome VARCHAR(40) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	PRIMARY KEY(codpessoa)
)
GO

CREATE TABLE fornecedor
(
	codpessoa INT NOT NULL,
	cnpj CHAR(14) NOT NULL,
	representante VARCHAR(20) NOT NULL,
	PRIMARY KEY(codpessoa),
	FOREIGN KEY(codpessoa) REFERENCES pessoa,
	UNIQUE(cnpj)
)
GO

CREATE TABLE pessoa_fisica
(
	codpessoa INT NOT NULL,
	cpf CHAR(11) NOT NULL,
	dtnascimento DATE NOT NULL,
	email VARCHAR(40) NOT NULL,
	telefone CHAR(11) NOT NULL,
	PRIMARY KEY(codpessoa),
	FOREIGN KEY(codpessoa) REFERENCES pessoa,
	UNIQUE(cpf)
)
GO

CREATE TABLE cliente
(
	cpf CHAR(11) NOT NULL,
	numcompras INT NOT NULL,
	PRIMARY KEY(cpf),
	FOREIGN KEY(cpf) REFERENCES pessoa_fisica(cpf)
)
GO

CREATE TABLE colaborador
(
	cpf CHAR(11) NOT NULL,
	numvendas INT NOT NULL,
	salario NUMERIC(7,2) NOT NULL,
	comissao NUMERIC(6,2) NOT NULL,
	login VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	PRIMARY KEY(cpf),
	FOREIGN KEY(cpf) REFERENCES pessoa_fisica(cpf)
)
GO

CREATE TABLE produto
(
	codproduto INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	preco NUMERIC(8,2) NOT NULL,
	qtdestoque INT NOT NULL,
	marca VARCHAR(30) NOT NULL,
	modelo VARCHAR(30) NOT NULL,
	garantia TINYINT NOT NULL,
	PRIMARY KEY(codproduto)
)
GO

CREATE TABLE notafiscalvenda
(
	numnota NUMERIC(10,0) NOT NULL,
	valortotal NUMERIC(10,2) NOT NULL,
	data DATETIME NOT NULL,
	cod_cli CHAR(11) NOT NULL,
	cod_colab CHAR(11) NOT NULL,
	PRIMARY KEY(numnota),
	FOREIGN KEY(cod_cli) REFERENCES cliente,
	FOREIGN KEY(cod_colab) REFERENCES colaborador
)
GO

CREATE INDEX ix_notafiscalvenda_cliente
ON notafiscalvenda(cod_cli)
GO

CREATE INDEX ix_notafiscalvenda_colaborador
ON notafiscalvenda(cod_colab)
GO

CREATE TABLE itemnotafiscalvenda
(
	numnota NUMERIC(10,0) NOT NULL,
	codproduto INT NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY(numnota, codproduto),
	FOREIGN KEY(numnota) REFERENCES notafiscalvenda,
	FOREIGN KEY(codproduto) REFERENCES produto
)
GO

CREATE TABLE notafiscalcompra
(
	numnota NUMERIC(10,0) NOT NULL,
	valortotal NUMERIC(10,2) NOT NULL,
	data DATETIME NOT NULL,
	cod_forn INT NOT NULL,
	PRIMARY KEY(numnota),
	FOREIGN KEY(cod_forn) REFERENCES fornecedor
)
GO

CREATE INDEX ix_notafiscalcompra_fornecedor
ON notafiscalcompra(cod_forn)
GO

CREATE TABLE itemnotafiscalcompra
(
	numnota NUMERIC(10,0) NOT NULL,
	codproduto INT NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY(numnota, codproduto),
	FOREIGN	KEY(numnota) REFERENCES notafiscalcompra,
	FOREIGN KEY(codproduto) REFERENCES produto
)
GO

CREATE TABLE fatura
(
	numfatura INT NOT NULL,
	dtvencimento DATETIME NOT NULL,
	dtpagamento DATETIME NULL,
	valor NUMERIC(10,2) NOT NULL,
	numnota_cli NUMERIC(10,0) NULL,
	numnota_forn NUMERIC(10,0) NULL,
	PRIMARY KEY(numfatura),
	FOREIGN KEY(numnota_cli) REFERENCES notafiscalvenda,
	FOREIGN KEY(numnota_forn) REFERENCES notafiscalcompra
)
GO

CREATE INDEX ix_fatura_notafiscalvenda
ON fatura(numnota_cli)
GO

CREATE INDEX ix_fatura_notafiscalcompra
ON fatura(numnota_forn)
GO

CREATE TABLE faturapaga
(
	numfatura INT NOT NULL,
	dtvencimento DATETIME NOT NULL,
	dtpagamento DATETIME NOT NULL,
	valor NUMERIC(10,2) NOT NULL,
	numnota_cli NUMERIC(10,0) NULL,
	numnota_forn NUMERIC(10,0) NULL,
	PRIMARY KEY (numfatura),
	FOREIGN KEY(numnota_cli) REFERENCES notafiscalvenda,
	FOREIGN KEY(numnota_forn) REFERENCES notafiscalcompra
)
GO

CREATE INDEX ix_faturapaga_notafiscalvenda
ON faturapaga(numnota_cli)
GO

CREATE INDEX ix_faturapaga_notafiscalcompra
ON faturapaga(numnota_forn)
GO

CREATE TABLE instrumento
(
	codproduto INT NOT NULL,
	cor VARCHAR(20) NOT NULL,
	tipoinstrumento VARCHAR(30) NOT NULL,
	peso NUMERIC(5, 2) NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES produto
)
GO

CREATE TABLE acessorio
(
	codproduto INT NOT NULL,
	tipoacessorio VARCHAR(30) NOT NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES produto
)
GO

CREATE TABLE corda
(
	codproduto INT NOT NULL,
	numcordas NUMERIC(1, 0) NOT NULL,
	numtrastes NUMERIC(2, 0) NULL,
	tipocorda CHAR(1) NOT NULL,
	sonoridade CHAR(8) NOT NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES instrumento
)
GO

CREATE TABLE percussao
(
	codproduto INT NOT NULL,
	tampolegadas NUMERIC(4, 2) NOT NULL,
	material VARCHAR(30) NULL,
	sonoridade CHAR(8) NOT NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES instrumento
)
GO

CREATE TABLE teclado
(
	codproduto INT NOT NULL,
	numteclas NUMERIC(2, 0) NOT NULL,
	polifoniamax NUMERIC(3, 0) NULL,
	metronomo CHAR(1) NOT NULL,
	sonoridade CHAR(8) NOT NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES instrumento
)
GO

CREATE TABLE sopro
(
	codproduto INT NOT NULL,
	numfurosbocal NUMERIC(2, 0) NOT NULL,
	afinacao CHAR(2) NOT NULL,
	acabamentoboquilha VARCHAR(20) NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES instrumento
)
GO

CREATE TABLE encordoamento
(
	codproduto INT NOT NULL,
	numcordas NUMERIC(1, 0) NOT NULL,
	material VARCHAR(30) NOT NULL,
	escala CHAR(1) NULL,
	tensao NUMERIC(3, 3) NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES acessorio
)
GO

CREATE TABLE pedal
(
	codproduto INT NOT NULL,
	tipopedal VARCHAR(30) NOT NULL,
	digitalanalogico CHAR(1) NULL,
	tensaoalimentacao NUMERIC(2, 0) NOT NULL,
	consumoenergia NUMERIC(3, 0) NOT NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES acessorio
)
GO

CREATE TABLE palheta
(
	codproduto INT NOT NULL,
	espessura NUMERIC(3, 2) NOT NULL,
	material VARCHAR(30) NOT NULL,
	PRIMARY KEY(codproduto),
	FOREIGN KEY(codproduto) REFERENCES acessorio
)
GO

SELECT * FROM pessoa
SELECT * FROM fornecedor
SELECT * FROM pessoa_fisica
SELECT * FROM cliente
SELECT * FROM colaborador
SELECT * FROM produto
SELECT * FROM notafiscalvenda
SELECT * FROM itemnotafiscalvenda
SELECT * FROM notafiscalcompra
SELECT * FROM itemnotafiscalcompra
SELECT * FROM fatura
SELECT * FROM faturapaga
SELECT * FROM instrumento
SELECT * FROM acessorio
SELECT * FROM corda
SELECT * FROM percussao
SELECT * FROM teclado
SELECT * FROM sopro
SELECT * FROM encordoamento
SELECT * FROM pedal
SELECT * FROM palheta

/*
DROP TABLE palheta, pedal, encordoamento, sopro, teclado, percussao, corda, acessorio, instrumento, 
	fatura, faturapaga, itemnotafiscalcompra, notafiscalcompra, itemnotafiscalvenda, notafiscalvenda, 
	produto, colaborador, cliente, pessoa_fisica, fornecedor, pessoa
*/