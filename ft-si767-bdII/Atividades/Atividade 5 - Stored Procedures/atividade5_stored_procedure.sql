/* 1. Criação de todas as tabelas da Base de Dados - DDL */

CREATE TABLE pessoa
(
	codigo NUMERIC(6, 0) NOT NULL,
	nome CHAR(40) NOT NULL,
	endereco VARCHAR(40) NOT NULL,
	telefone NUMERIC(12, 0) NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE cliente
(
	codigo NUMERIC(6, 0) NOT NULL,
	rg CHAR(10) NOT NULL,
	dtnasc DATETIME NULL,
	PRIMARY KEY (codigo),
	UNIQUE (rg),
	FOREIGN KEY (codigo) REFERENCES pessoa
)
GO

CREATE TABLE atendente
(
	codigo NUMERIC(6, 0) NOT NULL,
	salario NUMERIC(7, 2) NOT NULL,
	comissao NUMERIC(3, 1) NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (codigo) REFERENCES pessoa
)
GO

CREATE TABLE livro
(
	codigo NUMERIC(6, 0) NOT NULL,
	titulo CHAR(30) NOT NULL,
	autor CHAR(30) NOT NULL,
	preco NUMERIC(7, 2) NOT NULL,
	qtd_estoque NUMERIC(3, 0) NOT NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE venda
(
	codigo NUMERIC(6, 0) NOT NULL,
	data DATETIME NOT NULL,
	cod_cli NUMERIC(6, 0) NOT NULL,
	cod_aten NUMERIC(6, 0) NOT NULL,
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
	cod_venda NUMERIC(6, 0) NOT NULL,
	cod_livro NUMERIC(6, 0) NOT NULL,
	quantidade NUMERIC(3, 0) NOT NULL,
	PRIMARY KEY (cod_venda, cod_livro),
	FOREIGN KEY (cod_venda) REFERENCES venda,
	FOREIGN KEY (cod_livro) REFERENCES livro
)
GO

CREATE INDEX ix_itemvenda_livro
ON itemvenda (cod_livro)
GO

-- DROP TABLE itemvenda, venda, livro, atendente, cliente, pessoa

/* Cadastrar algumas pessoas para testar sobreposição posteriormente */
-- Atendente
INSERT INTO pessoa
VALUES (2, 'Beatriz', 'Av. das Nações, 729', 19123456782)
INSERT INTO atendente
VALUES (2, 2300.00, 10.0)
GO
-- Cliente
INSERT INTO pessoa
VALUES (4, 'Gilberto', 'Rua Translação, 222', 19123456784)
INSERT INTO cliente
VALUES (4, '123456784', '19991020')
GO

SELECT * FROM pessoa
SELECT * FROM cliente
SELECT * FROM atendente
SELECT * FROM livro
SELECT * FROM venda
SELECT * FROM itemvenda
GO

/* 2. Stored Procedures */

/* 2.a) Cadastro de um cliente */
-- Método 1
CREATE PROCEDURE ins_cliente
@codigo NUMERIC(6, 0),
@nome CHAR(40),
@endereco VARCHAR(40),
@telefone NUMERIC(12, 0),
@rg CHAR(10),
@dtnasc DATETIME
AS
BEGIN TRANSACTION
IF NOT EXISTS(SELECT * FROM pessoa WHERE codigo = @codigo) /* pessoa ainda não existe */
BEGIN
	INSERT INTO pessoa
	VALUES (@codigo, @nome, @endereco, @telefone)
	IF @@rowcount > 0 /* inserção de pessoa bem sucedida */
	BEGIN
		INSERT INTO cliente
	    VALUES (@codigo, @rg, @dtnasc)
	    IF @@rowcount > 0 /* insercao de cliente bem sucedida */
	    BEGIN
	        commit transaction
	        return 1
	    END
	    ELSE
	    BEGIN
	        rollback transaction
	        return 0
	    END
	END
	ELSE
	BEGIN
	    rollback transaction
	    return 0
	END
END
ELSE /* pessoa já existe */
BEGIN
	INSERT INTO cliente
    VALUES (@codigo, @rg, @dtnasc)
    IF @@rowcount > 0 /* insercao de cliente bem sucedida */
    BEGIN
        commit transaction
        return 1
    END
    ELSE
    BEGIN
        rollback transaction
        return 0
    END
END
GO

-- Método 2
CREATE PROCEDURE ins_cliente
@codigo NUMERIC(6, 0),
@nome CHAR(40),
@endereco VARCHAR(40),
@telefone NUMERIC(12, 0),
@rg CHAR(10),
@dtnasc DATETIME
AS
BEGIN TRANSACTION
	IF NOT EXISTS(SELECT * FROM pessoa WHERE codigo = @codigo) /* pessoa ainda não existe */
	BEGIN
		INSERT INTO pessoa
		VALUES (@codigo, @nome, @endereco, @telefone)
		IF @@rowcount = 0 /* inserção de pessoa bem sucedida */
		BEGIN
			rollback transaction
	        return 0
	    END
	END
	INSERT INTO cliente
	VALUES (@codigo, @rg, @dtnasc)
	IF @@rowcount > 0 /* insercao de cliente bem sucedida */
	BEGIN
	    commit transaction
	    return 1
	END
	ELSE
	BEGIN
	    rollback transaction
	    return 0
	END
GO

-- Inserindo novo cliente (pessoa ainda não cadastrada)
DECLARE @ret INT 
EXEC @ret =  ins_cliente 1, 'Alberto', 'Av. das Pamonhas, 51', 11123456781, '123456781', '19760415'
PRINT @ret
GO

-- Inserindo novo cliente (pessoa já cadastrada)
DECLARE @ret INT
EXEC @ret =  ins_cliente 2, 'Beatriz', 'Av. das Nações, 729', 19123456782, '123456782', '20051208'
PRINT @ret
GO

/* 2.b) Cadastro de um atendente */
CREATE PROCEDURE ins_atendente
@codigo NUMERIC(6, 0),
@nome CHAR(40),
@endereco VARCHAR(40),
@telefone NUMERIC(12, 0),
@salario NUMERIC(7, 2),
@comissao NUMERIC(3, 1)
AS
BEGIN TRANSACTION
IF NOT EXISTS(SELECT * FROM pessoa WHERE codigo = @codigo) /* pessoa ainda não existe */
BEGIN
	INSERT INTO pessoa
	VALUES (@codigo, @nome, @endereco, @telefone)
	IF @@rowcount > 0 /* inserção de pessoa bem sucedida */
	BEGIN
		INSERT INTO atendente
    	VALUES (@codigo, @salario, @comissao)
	    IF @@rowcount > 0 /* insercao de atendente bem sucedida */
	    BEGIN
	        commit transaction
	        return 1
	    END
	    ELSE
	    BEGIN
	        rollback transaction
	        return 0
	    END
	END
	ELSE
	BEGIN
	    rollback transaction
	    return 0
	END
END
ELSE /* pessoa já existe */
BEGIN
	INSERT INTO atendente
	VALUES (@codigo, @salario, @comissao)
    IF @@rowcount > 0 /* insercao de atendente bem sucedida */
    BEGIN
        commit transaction
        return 1
    END
    ELSE
    BEGIN
        rollback transaction
        return 0
    END
END
GO

-- Inserindo novo atendente (pessoa ainda não cadastrada)
DECLARE @ret INT
EXEC @ret =  ins_atendente 3, 'Carlos', 'Av. das Nações, 111', 11123456783, 2030.59, 9.0
PRINT @ret
GO

-- Inserindo novo atendente (pessoa já cadastrada)
DECLARE @ret INT
EXEC @ret =  ins_atendente 4, 'Gilberto', 'Rua Translação, 222', 19123456784, 1290.36, 40.0
PRINT @ret
GO

/* 2.c) Cadastro itens de venda (relacionamento compor), 
atualizando o estoque de cada livro vendido. Considere que o cliente,
o atendente, os livros e a venda já foram previamente cadastrados. */

-- Livros previamente cadastrados
INSERT INTO livro (codigo, titulo, autor, preco, qtd_estoque)
VALUES (1, 'Banco de Dados I', 'Abel Gusmão', 59.99, 50)
INSERT INTO livro (codigo, titulo, autor, preco, qtd_estoque)
VALUES (2, 'Banco de Dados II', 'Bernardo Luiz', 69.99, 70)
GO

-- Venda previamente cadastrada
INSERT INTO venda (codigo, data, cod_cli, cod_aten)
VALUES (1, GETDATE(), 1, 4)
GO

-- Stored Procedure de itemvenda
CREATE PROCEDURE ins_itemvenda
@cod_venda INT,
@cod_livro INT,
@quantidade INT
AS
BEGIN TRANSACTION
INSERT INTO itemvenda
VALUES (@cod_venda, @cod_livro, @quantidade)
IF @@rowcount > 0 /* inserção de itemvenda bem sucedida */
BEGIN
	UPDATE livro
	SET qtd_estoque  = qtd_estoque - @quantidade
	WHERE codigo = @cod_livro
	IF @@rowcount > 0 /* atualização de estoque do livro bem sucedida */
	BEGIN
		commit transaction
		return 1
	END
	ELSE
	BEGIN
		rollback transaction
		return 0
	END
END
ELSE
BEGIN
	rollback transaction
	return 0
END
GO

-- Inserindo novo livro na compra do cliente
DECLARE @ret INT
EXEC @ret =  ins_itemvenda 1, 1, 1
PRINT @ret
GO

-- Inserindo novo livro na compra do cliente
DECLARE @ret INT
EXEC @ret =  ins_itemvenda 1, 2, 5
PRINT @ret
GO

SELECT * FROM pessoa
SELECT * FROM cliente
SELECT * FROM atendente
SELECT * FROM livro
SELECT * FROM venda
SELECT * FROM itemvenda

-- DROP PROCEDURE ins_cliente, ins_atendente, ins_itemvenda