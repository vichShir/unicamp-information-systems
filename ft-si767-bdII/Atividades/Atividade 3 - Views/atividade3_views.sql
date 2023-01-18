/* 1. Criação de todas as tabelas da Base de Dados - DDL */

CREATE TABLE produto 
(
	codproduto INT NOT NULL,
	nome CHAR(40) NOT NULL,
	preco NUMERIC(5,2) NOT NULL,
	qtdestoque INT NOT NULL,
	PRIMARY KEY (codproduto)
);
GO

CREATE TABLE notafiscal 
(
	numnota NUMERIC(10, 0) NOT NULL,
	valortotal NUMERIC(10, 2) NOT NULL,
	-- data...
	PRIMARY KEY (numnota)
);
GO

-- Relacionamento (não eh agregação)
CREATE TABLE itemnotafiscal
(
	numnota NUMERIC(10, 0) NOT NULL,
	codproduto INT NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY (numnota, codproduto),
	FOREIGN KEY (numnota) REFERENCES notafiscal,
	FOREIGN KEY (codproduto) REFERENCES produto
);
GO

CREATE INDEX ix_itemnotasical_produto
ON itemnotafiscal(codproduto);
GO

CREATE TABLE fatura
(
	numfatura INT NOT NULL,
	dtvencimento DATETIME NOT NULL,
	dtpagamento DATETIME NULL,
	valor NUMERIC(5, 2) NOT NULL,
	numnota NUMERIC(10, 0) NOT NULL,
	PRIMARY KEY (numfatura),
	FOREIGN KEY (numnota) REFERENCES notafiscal
);
GO

CREATE INDEX ix_fatura_notafiscal
ON fatura(numnota);
GO

/* Informações da tabela */
EXEC sp_help fatura

-- DROP TABLE fatura, itemnotafiscal, notafiscal, produto

/* DML */
INSERT INTO produto VALUES (1, 'Mouse1', 50.99, 989);
INSERT INTO produto VALUES (2, 'Teclado2', 350.89, 500);
INSERT INTO produto VALUES (3, 'Monitor3', 764.89, 100);
INSERT INTO produto VALUES (4, 'Pendrive4', 16.99, 2500);

INSERT INTO notafiscal VALUES (1, 0);
INSERT INTO notafiscal VALUES (2, 0);
INSERT INTO notafiscal VALUES (3, 0);
INSERT INTO notafiscal VALUES (4, 0);
INSERT INTO notafiscal VALUES (5, 0);

INSERT INTO itemnotafiscal VALUES (1, 2, 4);
INSERT INTO itemnotafiscal VALUES (2, 2, 3);
INSERT INTO itemnotafiscal VALUES (3, 4, 1);
INSERT INTO itemnotafiscal VALUES (4, 2, 1);
INSERT INTO itemnotafiscal VALUES (5, 4, 2);

INSERT INTO fatura VALUES (1, '20210928', '20210911', 61.00, 1);
INSERT INTO fatura VALUES (2, '20210917', '20210901', 1001.89, 5);
INSERT INTO fatura VALUES (3, '20210915', NULL, 405.99, 3);
INSERT INTO fatura VALUES (4, '20210915', NULL, 81.89, 2);
INSERT INTO fatura VALUES (5, '20210909', '20210819', 604.99, 4);

SELECT * FROM produto;
SELECT * FROM notafiscal;
SELECT * FROM itemnotafiscal;
SELECT * FROM fatura;

/* 2. Views */

/* 2.a) Listar o codproduto, nome e qtdestoque dos produtos que nunca foram vendidos. */
CREATE VIEW vw_prods_nunca_vendidos
AS
SELECT DISTINCT p.codproduto, p.nome, p.qtdestoque
FROM produto p
LEFT JOIN itemnotafiscal i
	ON p.codproduto = i.codproduto
WHERE i.quantidade IS NULL

CREATE VIEW vw_prods_nunca_vendidos
AS
SELECT codproduto, nome, qtdestoque
FROM produto
WHERE codproduto NOT IN (SELECT DISTINCT codproduto
						 FROM itemnotafiscal)

SELECT * FROM vw_prods_nunca_vendidos

/* 2.b) Para cada produto, sumarizar a quantidade vendida (função de agregação sum()), resultando em
codproduto, nome e quantidade total vendida (não esquecer da necessidade de utilizar GROUP BY). */
CREATE VIEW vw_prods_qtdtotal_vendida
AS
SELECT p.codproduto, p.nome, sum(i.quantidade) total
FROM produto p
INNER JOIN itemnotafiscal i
	ON p.codproduto = i.codproduto
GROUP BY p.codproduto, p.nome

SELECT * FROM vw_prods_qtdtotal_vendida

/* 2.c) Para cada nota fiscal, listar o numnota, o valortotal e o nome, o preço dos produtos vinculados,
juntamente com a quantidade vendida e o valor vendido (quantidade * preço). */
CREATE VIEW vw_notafiscal_produto
AS
SELECT n.numnota, n.valortotal, p.nome, p.preco, i.quantidade, (i.quantidade * p.preco) 'precototal'
FROM notafiscal n 
INNER JOIN itemnotafiscal i
	ON n.numnota = i.numnota
	INNER JOIN produto p
	ON p.codproduto = i.codproduto

SELECT * FROM vw_notafiscal_produto

/* 2.d) Para cada nota fiscal, listar o numnota, o valortotal e para cada fatura vinculada ainda não paga
(dtpagamento com valor nulo), listar numfatura, dtvencimento e valor. */
CREATE VIEW vw_faturas_nao_pagas
AS
SELECT n.numnota, n.valortotal, f.numfatura, f.dtvencimento, f.valor
FROM notafiscal n 
INNER JOIN fatura f
	ON n.numnota = f.numnota
WHERE dtpagamento is NULL

SELECT * FROM vw_faturas_nao_pagas

/* 2.e) Para cada nota fiscal cujas faturas foram todas pagas, listar o numnota e o valor total. */
CREATE VIEW vw_faturas_todas_pagas
AS
SELECT numnota, valortotal
FROM notafiscal
WHERE numnota NOT IN (SELECT DISTINCT numnota
				  	  FROM fatura
				  	  WHERE dtpagamento IS NULL)

SELECT * FROM vw_faturas_todas_pagas

-- DROP VIEW vw_prods_nunca_vendidos, vw_prods_qtdtotal_vendida, vw_notafiscal_produto, vw_faturas_nao_pagas, vw_faturas_todas_pagas