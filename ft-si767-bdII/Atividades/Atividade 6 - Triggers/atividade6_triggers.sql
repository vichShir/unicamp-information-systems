/* 1. Criação de todas as tabelas da Base de Dados - DDL */

CREATE TABLE produto 
(
	codproduto INT NOT NULL,
	nome VARCHAR(60) NOT NULL,
	preco NUMERIC(5,2) NOT NULL,
	qtdestoque INT NOT NULL,
	PRIMARY KEY (codproduto)
)
GO

CREATE TABLE notafiscal 
(
	numnota NUMERIC(10,0) NOT NULL,
	valortotal NUMERIC(10,2) NOT NULL,
	PRIMARY KEY (numnota)
)
GO

CREATE TABLE itemnotafiscal 
(
	numnota NUMERIC(10,0) NOT NULL,
	codproduto INT NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY (numnota, codproduto),
	FOREIGN KEY (numnota) REFERENCES notafiscal,
	FOREIGN KEY (codproduto) REFERENCES produto
)
GO

CREATE INDEX ix_itemnota_codproduto
ON itemnotafiscal(codproduto)
GO

CREATE TABLE fatura 
(
	numfatura INT NOT NULL,
	dtvencimento DATETIME NOT NULL,
	dtpagamento DATETIME NULL,
	valor NUMERIC(5,2) NOT NULL,
	numnota NUMERIC(10,0) NOT NULL,
	PRIMARY KEY (numfatura),
	FOREIGN KEY (numnota) REFERENCES notafiscal
)
GO

CREATE INDEX ix_fatura_numnota
ON fatura(numnota)
GO

-- Criação da tabela faturapaga (2.d)
CREATE TABLE faturapaga
(
	numfatura INT NOT NULL,
	dtvencimento DATETIME NOT NULL,
	dtpagamento DATETIME NULL,
	valor NUMERIC(5,2) NOT NULL,
	numnota NUMERIC(10, 0) NOT NULL,
	PRIMARY KEY (numfatura),
	FOREIGN KEY (numnota) REFERENCES notafiscal
)
GO

CREATE INDEX ix_faturapaga_numnota
ON faturapaga(numnota)
GO

-- DROP TABLE faturapaga, fatura, itemnotafiscal, notafiscal, produto

SELECT * FROM produto
SELECT * FROM notafiscal
SELECT * FROM itemnotafiscal
SELECT * FROM fatura
SELECT * FROM faturapaga
GO

/* 2. Triggers */

/* 2.a) Toda vez que um item de nota fiscal for incluído, 
seja atualizada a quantidade em estoque do produto e o 
valor total da nota fiscal; */

-- Criação da trigger
CREATE TRIGGER inclusaoitemnota
ON itemnotafiscal FOR INSERT
AS
	UPDATE notafiscal
    SET valortotal = valortotal + (SELECT i.quantidade * p.preco 
     	                           FROM produto p INNER JOIN inserted i 
            		                    ON p.codproduto = i.codproduto)
   	WHERE numnota = (SELECT numnota FROM inserted) 
	IF @@rowcount > 0 /* atualização do valor total bem sucedida */
	BEGIN
		UPDATE produto
	  	SET qtdestoque = qtdestoque - (SELECT quantidade FROM inserted)
	  	WHERE codproduto = (SELECT codproduto FROM inserted)
	  	IF @@rowcount = 0 /* atualização do estoque mal sucedida */
	  		rollback transaction
	END
	ELSE
  	   rollback transaction
GO

-- Testes
INSERT INTO produto VALUES (1, 'lapis', 1.50, 10)
INSERT INTO produto VALUES (2, 'borracha', 2.00, 13)
INSERT INTO produto VALUES (3, 'caneta', 3.50, 15)

INSERT INTO notafiscal VALUES (1, 0)

INSERT INTO itemnotafiscal VALUES (1, 1, 2)
INSERT INTO itemnotafiscal VALUES (1, 2, 10)
INSERT INTO itemnotafiscal VALUES (1, 3, 2)

SELECT * FROM produto
SELECT * FROM notafiscal
SELECT * FROM itemnotafiscal
GO

/* 2.b) Toda vez que um item de nota fiscal for excluído, 
seja atualizada a quantidade em estoque do produto e o 
valor total da nota fiscal; */

-- Criação da trigger
CREATE TRIGGER exclusaoitemnota
ON itemnotafiscal FOR DELETE
AS 
   	UPDATE notafiscal
    SET valortotal = valortotal - (SELECT i.quantidade * p.preco 
     	                           FROM produto p INNER JOIN deleted i 
            		                    ON p.codproduto = i.codproduto)
   	WHERE numnota = (SELECT numnota FROM deleted)
    IF @@rowcount > 0 /* atualização do valor total bem sucedida */
    BEGIN
    	UPDATE produto
	  	SET qtdestoque = qtdestoque + (SELECT quantidade FROM deleted)
	  	WHERE codproduto = (SELECT codproduto FROM deleted)
	  	IF @@rowcount = 0 /* atualização do estoque mal sucedida */
	  		rollback transaction
    END
    ELSE
       rollback transaction
GO

-- Testes
DELETE FROM itemnotafiscal
WHERE numnota = 1 AND codproduto = 2

SELECT * FROM produto
SELECT * FROM notafiscal
SELECT * FROM itemnotafiscal
GO

/* 2.c) Toda vez que for alterada a quantidade de um item
de nota fiscal, seja atualizada a quantidade em estoque
do produto e o valor total da nota fiscal; */

-- Criação da trigger
CREATE TRIGGER alteracaoitemnota 
ON itemnotafiscal FOR UPDATE
AS 
IF UPDATE(quantidade) 
BEGIN
   	UPDATE notafiscal
   	SET valortotal = valortotal + (SELECT p.preco * (i.quantidade - d.quantidade) 
                                   FROM produto p INNER JOIN inserted i                  
                                        ON p.codproduto = i.codproduto 
                                        INNER JOIN deleted d              
                                        ON i.codproduto = d.codproduto AND 
                                          i.numnota = d.numnota)
   	WHERE numnota = (SELECT numnota FROM inserted)
   	IF @@rowcount > 0 /* atualização do valor total bem sucedida */
        UPDATE produto
		SET qtdestoque = qtdestoque - (SELECT i.quantidade - d.quantidade
									   FROM inserted i INNER JOIN deleted d
											ON i.codproduto = d.codproduto AND 
	                                           i.numnota = d.numnota)
		WHERE codproduto = (SELECT codproduto FROM inserted)
		IF @@rowcount = 0 /* atualização do estoque mal sucedida */
		   rollback transaction
   	ELSE
   		rollback transaction
END
GO

-- Testes
UPDATE itemnotafiscal SET quantidade = 5
WHERE numnota = 1 AND codproduto = 1

UPDATE itemnotafiscal SET quantidade = 4
WHERE numnota = 1 AND codproduto = 3

UPDATE itemnotafiscal SET quantidade = 1
WHERE numnota = 1 AND codproduto = 3

SELECT * FROM produto
SELECT * FROM notafiscal
SELECT * FROM itemnotafiscal
GO

/* 2.d) Toda vez que uma fatura for paga (atualização da
data de pagamento), seja excluída da tabela fatura e 
incluída em uma tabela faturapaga (a ser criada). */

-- Criação da trigger
CREATE TRIGGER inclusaofaturapaga
ON fatura FOR UPDATE
AS
IF UPDATE(dtpagamento) 
BEGIN
	INSERT INTO faturapaga SELECT * FROM inserted 
	IF @@rowcount > 0 /* inserção da fatura em faturapaga bem sucedida */
	BEGIN
	   	DELETE FROM fatura
	   	WHERE numfatura = (SELECT numfatura FROM inserted)
	   	IF @@rowcount = 0 /* exclusão da fatura mal sucedida */
	       rollback transaction
	END
   	ELSE
   		rollback transaction
END
GO

-- Testes
INSERT INTO fatura
VALUES (1, GETDATE(), NULL, 21.50, 1)

UPDATE fatura SET dtpagamento = GETDATE()
WHERE numfatura = 1

SELECT * FROM produto
SELECT * FROM notafiscal
SELECT * FROM itemnotafiscal
SELECT * FROM fatura
SELECT * FROM faturapaga
GO

-- DROP TRIGGER inclusaoitemnota, exclusaoitemnota, alteracaoitemnota, inclusaofaturapaga