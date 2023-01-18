/* STORED PROCEDURES */

/***********************************************************
	PESSOAS - CLIENTE
***********************************************************/
/* a) Cadastro de um cliente */
CREATE PROCEDURE ins_cliente
@codpessoa INT,
@nome VARCHAR(40),
@endereco VARCHAR(50),
@cpf CHAR(11),
@dtnascimento DATE,
@email VARCHAR(40),
@telefone CHAR(11),
@numcompras INT
AS
BEGIN TRANSACTION
	IF NOT EXISTS(SELECT * FROM fornecedor WHERE codpessoa = @codpessoa) /* pessoa não é fornecedor */
	BEGIN
		IF NOT EXISTS(SELECT * FROM pessoa WHERE codpessoa = @codpessoa) /* pessoa ainda não existe */
		BEGIN
			INSERT INTO pessoa
			VALUES (@codpessoa, @nome, @endereco)
			IF @@rowcount = 0 /* inserção de pessoa mal sucedida */
			BEGIN
				rollback transaction
		        return 0
		    END
		END
		IF NOT EXISTS(SELECT * FROM pessoa_fisica WHERE codpessoa = @codpessoa) /* pessoa_fisica ainda não existe */
		BEGIN
			INSERT INTO pessoa_fisica
			VALUES (@codpessoa, @cpf, @dtnascimento, @email, @telefone)
			IF @@rowcount = 0 /* inserção de pessoa_fisica mal sucedida */
			BEGIN
				rollback transaction
		        return 0
		    END
		END
		INSERT INTO cliente
		VALUES (@cpf, @numcompras)
		IF @@rowcount > 0 /* inserção de cliente bem sucedida */
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

/* b) Alteração de um cliente */
CREATE PROCEDURE alt_cliente
@codpessoa INT,
@nome VARCHAR(40),
@endereco VARCHAR(50),
@cpf CHAR(11),
@dtnascimento DATE,
@email VARCHAR(40),
@telefone CHAR(11),
@numcompras INT
AS
BEGIN TRANSACTION
	UPDATE pessoa
	SET nome = @nome, endereco = @endereco
	WHERE codpessoa = @codpessoa
	IF @@rowcount > 0 /* alteração de pessoa bem sucedida */
	BEGIN
		UPDATE pessoa_fisica
		SET dtnascimento = @dtnascimento, email = @email, telefone = @telefone
		WHERE codpessoa = @codpessoa
		IF @@rowcount > 0 /* alteração de pessoa_fisica bem sucedida */
		BEGIN
			UPDATE cliente
			SET numcompras = @numcompras
			WHERE cpf = @cpf
			IF @@rowcount > 0 /* alteração de cliente bem sucedida */
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
	ELSE
	BEGIN
		rollback transaction
		return 0
	END
GO

/* Exclusão de um cliente */
CREATE PROCEDURE del_cliente
@codpessoa INT,
@cpf CHAR(11)
AS
BEGIN TRANSACTION
	DELETE cliente
	WHERE cpf = @cpf
	IF @@rowcount > 0 /* exclusão de cliente bem sucedida */
	BEGIN
		DELETE pessoa_fisica
		WHERE codpessoa = @codpessoa
		IF @@rowcount > 0 /* exclusão de pessoa_fisica bem sucedida */
		BEGIN
			DELETE pessoa
			WHERE codpessoa = @codpessoa
			IF @@rowcount > 0 /* exclusão de pessoa bem sucedida */
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
	ELSE
	BEGIN
		rollback transaction
		return 0
	END
GO

/***********************************************************
	PESSOAS - COLABORADOR
***********************************************************/
/* Cadastro de um colaborador */
CREATE PROCEDURE ins_colaborador
@codpessoa INT,
@nome VARCHAR(40),
@endereco VARCHAR(50),
@cpf CHAR(11),
@dtnascimento DATE,
@email VARCHAR(40),
@telefone CHAR(11),
@numvendas INT,
@salario MONEY,
@comissao MONEY,
@login VARCHAR(20),
@senha VARCHAR(20)
AS
BEGIN TRANSACTION
	IF NOT EXISTS(SELECT * FROM fornecedor WHERE codpessoa = @codpessoa) /* pessoa não é fornecedor */
	BEGIN
		IF NOT EXISTS(SELECT * FROM pessoa WHERE codpessoa = @codpessoa) /* pessoa ainda não existe */
		BEGIN
			INSERT INTO pessoa
			VALUES (@codpessoa, @nome, @endereco)
			IF @@rowcount = 0 /* inserção de pessoa mal sucedida */
			BEGIN
				rollback transaction
		        return 0
		    END
		END
		IF NOT EXISTS(SELECT * FROM pessoa_fisica WHERE codpessoa = @codpessoa) /* pessoa_fisica ainda não existe */
		BEGIN
			INSERT INTO pessoa_fisica
			VALUES (@codpessoa, @cpf, @dtnascimento, @email, @telefone)
			IF @@rowcount = 0 /* inserção de pessoa_fisica mal sucedida */
			BEGIN
				rollback transaction
		        return 0
		    END
		END
		INSERT INTO colaborador
		VALUES (@cpf, @numvendas, @salario, @comissao, @login, @senha)
		IF @@rowcount > 0 /* inserção de colaborador bem sucedida */
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

/* Alteração de um colaborador */
CREATE PROCEDURE alt_colaborador
@codpessoa INT,
@nome VARCHAR(40),
@endereco VARCHAR(50),
@cpf CHAR(11),
@dtnascimento DATE,
@email VARCHAR(40),
@telefone CHAR(11),
@numvendas INT,
@salario MONEY,
@comissao MONEY,
@login VARCHAR(20),
@senha VARCHAR(20)
AS
BEGIN TRANSACTION
	UPDATE pessoa
	SET nome = @nome, endereco = @endereco
	WHERE codpessoa = @codpessoa
	IF @@rowcount > 0 /* alteração de pessoa bem sucedida */
	BEGIN
		UPDATE pessoa_fisica
		SET dtnascimento = @dtnascimento, email = @email, telefone = @telefone
		WHERE codpessoa = @codpessoa
		IF @@rowcount > 0 /* alteração de pessoa_fisica bem sucedida */
		BEGIN
			UPDATE colaborador
			SET numvendas = @numvendas, salario = @salario, comissao = @comissao, login = @login, senha = @senha
			WHERE cpf = @cpf
			IF @@rowcount > 0 /* alteração de colaborador bem sucedida */
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
	ELSE
	BEGIN
		rollback transaction
		return 0
	END
GO

/* Exclusão de um colaborador */
CREATE PROCEDURE del_colaborador
@codpessoa INT,
@cpf CHAR(11)
AS
BEGIN TRANSACTION
	DELETE colaborador
	WHERE cpf = @cpf
	IF @@rowcount > 0 /* exclusão de colaborador bem sucedida */
	BEGIN
		DELETE pessoa_fisica
		WHERE codpessoa = @codpessoa
		IF @@rowcount > 0 /* exclusão de pessoa_fisica bem sucedida */
		BEGIN
			DELETE pessoa
			WHERE codpessoa = @codpessoa
			IF @@rowcount > 0 /* exclusão de pessoa bem sucedida */
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
	ELSE
	BEGIN
		rollback transaction
		return 0
	END
GO

/***********************************************************
	PESSOAS - FORNECEDOR
***********************************************************/
/* a) Cadastro de um fornecedor */
CREATE PROCEDURE ins_fornecedor
@codpessoa INT,
@nome VARCHAR(40),
@endereco VARCHAR(50),
@cnpj CHAR(14),
@representante VARCHAR(20)
AS
BEGIN TRANSACTION
	INSERT INTO pessoa
	VALUES (@codpessoa, @nome, @endereco)
	IF @@rowcount > 0 /* inserção de pessoa bem sucedida */
	BEGIN
		INSERT INTO fornecedor
		VALUES (@codpessoa, @cnpj, @representante)
		IF @@rowcount > 0 /* inserção de fornecedor bem sucedida */
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

/* Alteração de um fornecedor */
CREATE PROCEDURE alt_fornecedor
@codpessoa INT,
@nome VARCHAR(40),
@endereco VARCHAR(50),
@cnpj CHAR(14),
@representante VARCHAR(20)
AS
BEGIN TRANSACTION
	UPDATE pessoa
	SET nome = @nome, endereco = @endereco
	WHERE codpessoa = @codpessoa
	IF @@rowcount > 0 /* alteração de pessoa bem sucedida */
	BEGIN
		UPDATE fornecedor
		SET cnpj = @cnpj, representante = @representante
		WHERE codpessoa = @codpessoa
		IF @@rowcount > 0 /* alteração do fornecedor bem sucedida */
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

/* Exclusão de um fornecedor */
CREATE PROCEDURE del_fornecedor
@codpessoa INT,
@cnpj CHAR(14)
AS
BEGIN TRANSACTION
	DELETE fornecedor
	WHERE cnpj = @cnpj
	IF @@rowcount > 0 /* exclusão do fornecedor bem sucedida */
	BEGIN
		DELETE pessoa
		WHERE codpessoa = @codpessoa
		IF @@rowcount > 0 /* exclusão do pessoa bem sucedida*/
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

/***********************************************************
*********************INSTRUMENTO****************************
***********************************************************/
/* a) Cadastro de um instrumento (produto) */
CREATE PROCEDURE ins_instrumento
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2)
AS
BEGIN TRANSACTION
	INSERT INTO produto
	VALUES (@codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia)
	IF @@rowcount > 0 /* inserção de produto bem sucedida */
	BEGIN
		INSERT INTO instrumento
		VALUES (@codproduto, @cor, @tipoinstrumento, @peso)
		IF @@rowcount > 0 /* inserção de instrumento bem sucedida */
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

/* b) Alteração de um instrumento (produto) */
CREATE PROCEDURE alt_instrumento
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2)
AS
BEGIN TRANSACTION
	UPDATE produto
	SET nome = @nome, preco = @preco, qtdestoque = @qtdestoque, marca = @marca, modelo = @modelo, garantia = @garantia
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* alteração de produto bem sucedida */
	BEGIN
		UPDATE instrumento
		SET cor = @cor, tipoinstrumento = @tipoinstrumento, peso = @peso
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de instrumento bem sucedida */
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

/* c) Exclusão de um instrumento (produto) */
CREATE PROCEDURE del_instrumento
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE instrumento
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do instrumento bem sucedida */
	BEGIN
		DELETE produto
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* exclusão do produto bem sucedida */
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

/***********************************************************
	INSTRUMENTO - CORDA
***********************************************************/
/* a) Cadastro de um instrumento de corda */
CREATE PROCEDURE ins_instrumento_corda
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@numcordas NUMERIC(1, 0),
@numtrastes NUMERIC(2, 0),
@tipocorda CHAR(1),
@sonoridade CHAR(8)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* inserção de instrumento bem sucedida */
	BEGIN
		INSERT INTO corda
		VALUES (@codproduto, @numcordas, @numtrastes, @tipocorda, @sonoridade)
		IF @@rowcount > 0 /* inserção de corda bem sucedida */
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

/* b) Alteração de um instrumento de corda */
CREATE PROCEDURE alt_instrumento_corda
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@numcordas NUMERIC(1, 0),
@numtrastes NUMERIC(2, 0),
@tipocorda CHAR(1),
@sonoridade CHAR(8)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* alteração de instrumento bem sucedida */
	BEGIN
		UPDATE corda
		SET numcordas = @numcordas, numtrastes = @numtrastes, tipocorda = @tipocorda, sonoridade = @sonoridade
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de corda bem sucedida */
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

/* c) Exclusão de um instrumento de corda */
CREATE PROCEDURE del_instrumento_corda
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE corda
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do instrumento de corda bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_instrumento @codproduto
		IF @ret > 0 /* exclusão de instrumento bem sucedida */
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

/***********************************************************
	INSTRUMENTO - PERCUSSAO
***********************************************************/
/* a) Cadastro de um instrumento de percussao */
CREATE PROCEDURE ins_instrumento_percussao
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@tampolegadas NUMERIC(4, 2),
@material VARCHAR(30),
@sonoridade CHAR(8)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* inserção de instrumento bem sucedida */
	BEGIN
		INSERT INTO percussao
		VALUES (@codproduto, @tampolegadas, @material, @sonoridade)
		IF @@rowcount > 0 /* inserção de percussao bem sucedida */
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

/* b) Alteração de um instrumento de percussao */
CREATE PROCEDURE alt_instrumento_percussao
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@tampolegadas NUMERIC(4, 2),
@material VARCHAR(30),
@sonoridade CHAR(8)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* alteração de instrumento bem sucedida */
	BEGIN
		UPDATE percussao
		SET tampolegadas = @tampolegadas, material = @material, sonoridade = @sonoridade
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de percussao bem sucedida */
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

/* c) Exclusão de um instrumento de percussao */
CREATE PROCEDURE del_instrumento_percussao
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE percussao
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do instrumento de percussao bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_instrumento @codproduto
		IF @ret > 0 /* exclusão de instrumento bem sucedida */
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

/***********************************************************
	INSTRUMENTO - TECLADO
***********************************************************/
/* a) Cadastro de um instrumento de teclado */
CREATE PROCEDURE ins_instrumento_teclado
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@numteclas NUMERIC(2, 0),
@polifoniamax NUMERIC(3, 0),
@metronomo CHAR(1),
@sonoridade CHAR(8)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* inserção de instrumento bem sucedida */
	BEGIN
		INSERT INTO teclado
		VALUES (@codproduto, @numteclas, @polifoniamax, @metronomo, @sonoridade)
		IF @@rowcount > 0 /* inserção de teclado bem sucedida */
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

/* b) Alteração de um instrumento de teclado */
CREATE PROCEDURE alt_instrumento_teclado
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@numteclas NUMERIC(2, 0),
@polifoniamax NUMERIC(3, 0),
@metronomo CHAR(1),
@sonoridade CHAR(8)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* alteração de instrumento bem sucedida */
	BEGIN
		UPDATE teclado
		SET numteclas = @numteclas, polifoniamax = @polifoniamax, metronomo = @metronomo, sonoridade = @sonoridade
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de teclado bem sucedida */
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

/* c) Exclusão de um instrumento de teclado */
CREATE PROCEDURE del_instrumento_teclado
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE teclado
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do instrumento de teclado bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_instrumento @codproduto
		IF @ret > 0 /* exclusão de instrumento bem sucedida */
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

/***********************************************************
	INSTRUMENTO - SOPRO
***********************************************************/
/* a) Cadastro de um instrumento de sopro */
CREATE PROCEDURE ins_instrumento_sopro
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@numfurosbocal NUMERIC(2, 0),
@afinacao CHAR(2),
@acabamentoboquilha VARCHAR(20)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* inserção de instrumento bem sucedida */
	BEGIN
		INSERT INTO sopro
		VALUES (@codproduto, @numfurosbocal, @afinacao, @acabamentoboquilha)
		IF @@rowcount > 0 /* inserção de sopro bem sucedida */
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

/* b) Alteração de um instrumento de sopro */
CREATE PROCEDURE alt_instrumento_sopro
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@cor VARCHAR(20),
@tipoinstrumento VARCHAR(30),
@peso DECIMAL(5, 2),
@numfurosbocal NUMERIC(2, 0),
@afinacao CHAR(2),
@acabamentoboquilha VARCHAR(20)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_instrumento @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @cor, @tipoinstrumento, @peso
	IF @ret > 0 /* alteração de instrumento bem sucedida */
	BEGIN
		UPDATE sopro
		SET numfurosbocal = @numfurosbocal, afinacao = @afinacao, acabamentoboquilha = @acabamentoboquilha
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de sopro bem sucedida */
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

/* c) Exclusão de um instrumento de sopro */
CREATE PROCEDURE del_instrumento_sopro
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE sopro
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do instrumento de sopro bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_instrumento @codproduto
		IF @ret > 0 /* exclusão de instrumento bem sucedida */
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


/***********************************************************
*********************ACESSORIO******************************
***********************************************************/
/* a) Cadastro de um acessorio (produto) */
CREATE PROCEDURE ins_acessorio
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30)
AS
BEGIN TRANSACTION
	INSERT INTO produto
	VALUES (@codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia)
	IF @@rowcount > 0 /* inserção de produto bem sucedida */
	BEGIN
		INSERT INTO acessorio
		VALUES (@codproduto, @tipoacessorio)
		IF @@rowcount > 0 /* inserção de acessorio bem sucedida */
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

/* b) Alteração de um acessorio (produto) */
CREATE PROCEDURE alt_acessorio
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30)
AS
BEGIN TRANSACTION
	UPDATE produto
	SET nome = @nome, preco = @preco, qtdestoque = @qtdestoque, marca = @marca, modelo = @modelo, garantia = @garantia
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* alteração de produto bem sucedida */
	BEGIN
		UPDATE acessorio
		SET tipoacessorio = @tipoacessorio
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de acessorio bem sucedida */
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

/* c) Exclusão de um acessorio (produto) */
CREATE PROCEDURE del_acessorio
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE acessorio
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do acessorio bem sucedida */
	BEGIN
		DELETE produto
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* exclusão do produto bem sucedida */
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

/***********************************************************
	ACESSORIO - ENCORDOAMENTO
***********************************************************/
/* a) Cadastro de um acessorio de encordoamento */
CREATE PROCEDURE ins_acessorio_encordoamento
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30),
@numcordas NUMERIC(1, 0),
@material VARCHAR(30),
@escala CHAR(1),
@tensao NUMERIC(2, 2)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_acessorio @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @tipoacessorio
	IF @ret > 0 /* inserção de acessorio bem sucedida */
	BEGIN
		INSERT INTO encordoamento
		VALUES (@codproduto, @numcordas, @material, @escala, @tensao)
		IF @@rowcount > 0 /* inserção de encordoamento bem sucedida */
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

/* b) Alteração de um acessorio de encordoamento */
CREATE PROCEDURE alt_acessorio_encordoamento
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30),
@numcordas NUMERIC(1, 0),
@material VARCHAR(30),
@escala CHAR(1),
@tensao NUMERIC(2, 2)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_acessorio @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @tipoacessorio
	IF @ret > 0 /* alteração de acessorio bem sucedida */
	BEGIN
		UPDATE encordoamento
		SET numcordas = @numcordas, material = @material, escala = @escala, tensao = @tensao
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de encordoamento sucedida */
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

/* c) Exclusão de um acessorio de encordoamento */
CREATE PROCEDURE del_acessorio_encordoamento
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE encordoamento
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do encordoamento bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_acessorio @codproduto
		IF @ret > 0 /* exclusão de acessorio bem sucedida */
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

/***********************************************************
	ACESSORIO - PEDAL
***********************************************************/
/* a) Cadastro de um acessorio de pedal */
CREATE PROCEDURE ins_acessorio_pedal
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30),
@tipopedal VARCHAR(30),
@digitalanalogico CHAR(1),
@tensaoalimentacao NUMERIC(2, 0),
@consumoenergia NUMERIC(3, 0)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_acessorio @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @tipoacessorio
	IF @ret > 0 /* inserção de acessorio bem sucedida */
	BEGIN
		INSERT INTO pedal
		VALUES (@codproduto, @tipopedal, @digitalanalogico, @tensaoalimentacao, @consumoenergia)
		IF @@rowcount > 0 /* inserção de pedal bem sucedida */
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

/* b) Alteração de um acessorio de pedal */
CREATE PROCEDURE alt_acessorio_pedal
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30),
@tipopedal VARCHAR(30),
@digitalanalogico CHAR(1),
@tensaoalimentacao NUMERIC(2, 0),
@consumoenergia NUMERIC(3, 0)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_acessorio @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @tipoacessorio
	IF @ret > 0 /* alteração de acessorio bem sucedida */
	BEGIN
		UPDATE pedal
		SET tipopedal = @tipopedal, digitalanalogico = @digitalanalogico, tensaoalimentacao = @tensaoalimentacao, consumoenergia = @consumoenergia
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de pedal sucedida */
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

/* c) Exclusão de um acessorio de pedal */
CREATE PROCEDURE del_acessorio_pedal
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE pedal
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do pedal bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_acessorio @codproduto
		IF @ret > 0 /* exclusão de acessorio bem sucedida */
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

/***********************************************************
	ACESSORIO - PALHETA
***********************************************************/
/* a) Cadastro de um acessorio de palheta */
CREATE PROCEDURE ins_acessorio_palheta
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30),
@espessura NUMERIC(3, 2),
@material VARCHAR(30)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = ins_acessorio @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @tipoacessorio
	IF @ret > 0 /* inserção de acessorio bem sucedida */
	BEGIN
		INSERT INTO palheta
		VALUES (@codproduto, @espessura, @material)
		IF @@rowcount > 0 /* inserção de palheta bem sucedida */
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

/* b) Alteração de um acessorio de palheta */
CREATE PROCEDURE alt_acessorio_palheta
@codproduto INT,
@nome VARCHAR(100),
@preco NUMERIC(8,2),
@qtdestoque INT,
@marca VARCHAR(30),
@modelo VARCHAR(30),
@garantia TINYINT,
@tipoacessorio VARCHAR(30),
@espessura NUMERIC(3, 2),
@material VARCHAR(30)
AS
BEGIN TRANSACTION
	DECLARE @ret INT
	EXEC @ret = alt_acessorio @codproduto, @nome, @preco, @qtdestoque, @marca, @modelo, @garantia, @tipoacessorio
	IF @ret > 0 /* alteração de acessorio bem sucedida */
	BEGIN
		UPDATE palheta
		SET espessura = @espessura, material = @material
		WHERE codproduto = @codproduto
		IF @@rowcount > 0 /* alteração de palheta sucedida */
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

/* c) Exclusão de um acessorio de palheta */
CREATE PROCEDURE del_acessorio_palheta
@codproduto INT
AS
BEGIN TRANSACTION
	DELETE palheta
	WHERE codproduto = @codproduto
	IF @@rowcount > 0 /* exclusão do palheta bem sucedida */
	BEGIN
		DECLARE @ret INT
		EXEC @ret = del_acessorio @codproduto
		IF @ret > 0 /* exclusão de acessorio bem sucedida */
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

/*
DROP PROCEDURE ins_cliente, alt_cliente, del_cliente, 
	ins_colaborador, alt_colaborador, del_colaborador,
	ins_fornecedor, alt_fornecedor, del_fornecedor,
	-- Instrumentos
	ins_instrumento, alt_instrumento, del_instrumento,
	ins_instrumento_corda, alt_instrumento_corda, del_instrumento_corda,
	ins_instrumento_percussao, alt_instrumento_percussao, del_instrumento_percussao,
	ins_instrumento_teclado, alt_instrumento_teclado, del_instrumento_teclado,
	ins_instrumento_sopro, alt_instrumento_sopro, del_instrumento_sopro,
	-- Acessorios
	ins_acessorio, alt_acessorio, del_acessorio,
	ins_acessorio_encordoamento, alt_acessorio_encordoamento, del_acessorio_encordoamento,
	ins_acessorio_pedal, alt_acessorio_pedal, del_acessorio_pedal,
	ins_acessorio_palheta, alt_acessorio_palheta, del_acessorio_palheta
*/