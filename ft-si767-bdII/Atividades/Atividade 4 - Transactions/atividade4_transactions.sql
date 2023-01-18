/* 1. Criação de todas as tabelas da Base de Dados - DDL */

CREATE TABLE pessoa
(
	codigo int NOT NULL,
	nome varchar(40) NOT NULL,
	endereco varchar(30) NOT NULL,
	telefone char(11) NOT NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE cliente
(
	codigo int NOT NULL,
	rg char(9) NOT NULL,
	dtnasc date NOT NULL,
	PRIMARY KEY (codigo),
	UNIQUE (rg),
	FOREIGN KEY (codigo) REFERENCES pessoa
)
GO

CREATE TABLE atendente
(
	codigo int NOT NULL,
	salario money NOT NULL,
	comissao money NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (codigo) REFERENCES pessoa
)
GO

CREATE TABLE livro
(
	codigo int NOT NULL,
	titulo varchar(50) NOT NULL,
	autor varchar(40) NOT NULL,
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
	cod_aten int NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (cod_cli) REFERENCES cliente(codigo),
	FOREIGN KEY (cod_aten) REFERENCES atendente
)
GO

CREATE INDEX ix_venda_cliente
ON venda (cod_cli)
GO

CREATE INDEX ix_venda_atendente
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

CREATE INDEX ix_itemvenda_livro
ON itemvenda (cod_livro)
GO

-- DROP TABLE itemvenda, venda, livro, atendente, cliente, pessoa

SELECT * FROM pessoa
SELECT * FROM cliente
SELECT * FROM atendente
SELECT * FROM livro
SELECT * FROM venda
SELECT * FROM itemvenda

/* 2. Transações */

/* 2.a) Cadastro de um cliente */
BEGIN TRANSACTION
INSERT INTO pessoa
VALUES (1, 'Alberto', 'Av. das Pamonhas, 51', '11123456789')
IF @@rowcount > 0 /* inserção de pessoa bem sucedida */
BEGIN
	INSERT INTO cliente
    VALUES (1, '123456789', '19900130')
    IF @@rowcount > 0 /* insercao de cliente bem sucedida */
        commit transaction
    ELSE 
        rollback transaction
END
ELSE
    rollback transaction

/* 2.b) Cadastro de um atendente */
BEGIN TRANSACTION
INSERT INTO pessoa
VALUES (2, 'Beatriz', 'Av. das Nações, 729', '19123456789')
IF @@rowcount > 0 /* inserção de pessoa bem sucedida */
BEGIN
	INSERT INTO atendente
    VALUES (2, 2300, 100)
    IF @@rowcount > 0 /* insercao de atendente bem sucedida */
        commit transaction
    ELSE 
        rollback transaction
END
ELSE
    rollback transaction

/* 2.c) Cadastro  de  uma  venda  composta  por  dois  livros  distintos.  
Atualizar  o  estoque  de cada livro vendido. Considere que o cliente,
o atendente e os livros já foram previamente cadastrados. */

-- Livros previamente cadastrados
INSERT INTO livro
VALUES (1, 'Banco de Dados I', 'Abel Gusmão', 59.99, 50)
INSERT INTO livro
VALUES (2, 'Banco de Dados II', 'Bernardo Luiz', 69.99, 70)

-- Transação
BEGIN TRANSACTION
INSERT INTO venda
VALUES (1, getdate(), 1, 2)
IF @@rowcount > 0 /* inserção de venda bem sucedida */
BEGIN
	INSERT INTO itemvenda
	VALUES (1, 1, 1)
	IF @@rowcount > 0 /* inserção de itemvenda bem sucedida */
	BEGIN
		INSERT INTO itemvenda
		VALUES (1, 2, 1)
		IF @@rowcount > 0 /* inserção de itemvenda bem sucedida */
		BEGIN
			UPDATE livro
			SET qtd_estoque  = qtd_estoque - 1
			WHERE codigo = 1
		    IF @@rowcount > 0 /* atualização de estoque do livro bem sucedida */
		   	BEGIN
		   		UPDATE livro
				SET qtd_estoque  = qtd_estoque - 1
				WHERE codigo = 2
			    IF @@rowcount > 0 /* atualização de estoque do livro bem sucedida */
			    	commit transaction
			    ELSE
			        rollback transaction
		   	END
		    ELSE
		        rollback transaction
		END
		ELSE
			rollback transaction
	END
	ELSE
		rollback transaction
END
ELSE
    rollback transaction