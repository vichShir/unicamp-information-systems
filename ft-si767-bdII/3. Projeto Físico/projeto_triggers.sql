/* TRIGGERS */

/***********************************************************
	NOTA FISCAL DE VENDA
***********************************************************/
/* a) Toda vez que uma nota fiscal de venda for incluída,
seja atualizado o número de compras do cliente e o número
de vendas do colaborador; */
CREATE TRIGGER inclusaonotafiscalvenda
ON notafiscalvenda FOR INSERT
AS
	/* Atualizar o número de compras do cliente */
	UPDATE cliente
    SET numcompras = numcompras + 1
   	WHERE cpf = (SELECT cod_cli FROM inserted)
	IF @@rowcount > 0 -- atualização do número de compras bem sucedida
  	BEGIN
		/* Atualizar o número de vendas do colaborador */
		UPDATE colaborador
		SET numvendas = numvendas + 1
		WHERE cpf = (SELECT cod_colab FROM inserted)
		IF @@rowcount = 0 -- atualização do número de vendas mal sucedida
			rollback transaction
	END
	ELSE
		rollback transaction
GO

/* b) Toda vez que uma nota fiscal de venda for excluída,
seja atualizado o número de compras do cliente e o número
de vendas do colaborador; */
CREATE TRIGGER exclusaonotafiscalvenda
ON notafiscalvenda FOR DELETE
AS
	/* Atualizar o número de compras do cliente */
	UPDATE cliente
    SET numcompras = numcompras - 1
   	WHERE cpf = (SELECT cod_cli FROM deleted)
	IF @@rowcount > 0 -- atualização do número de compras bem sucedida
  	BEGIN
		/* Atualizar o número de vendas do colaborador */
		UPDATE colaborador
		SET numvendas = numvendas - 1
		WHERE cpf = (SELECT cod_colab FROM deleted)
		IF @@rowcount = 0 -- atualização do número de vendas mal sucedida
			rollback transaction
	END
	ELSE
		rollback transaction
GO

/* c) Toda vez que for alterado o código do cliente de uma nota fiscal
de venda (possível erro), seja atualizado o número de compras do cliente
anterior e do posterior; */
CREATE TRIGGER alteracaonotafiscalvendacli
ON notafiscalvenda FOR UPDATE
AS
IF UPDATE(cod_cli)
BEGIN
	/* Atualizar o número de compras do cliente anterior */
	UPDATE cliente
    SET numcompras = numcompras - 1
   	WHERE cpf = (SELECT cod_cli FROM deleted) 
	IF @@rowcount > 0 -- atualização do número de compras bem sucedida
  	BEGIN
		/* Atualizar o número de compras do cliente posterior */
		UPDATE cliente
		SET numcompras = numcompras + 1
		WHERE cpf = (SELECT cod_cli FROM inserted) 
		IF @@rowcount = 0 -- atualização do número de compras mal sucedida
			rollback transaction
	END
	ELSE
		rollback transaction
END
GO

/* d) Toda vez que for alterado o código do colaborador de uma nota fiscal
de venda (possível erro), seja atualizado o número de vendas do colaborador
anterior e do posterior; */
CREATE TRIGGER alteracaonotafiscalvendacolab
ON notafiscalvenda FOR UPDATE
AS
IF UPDATE(cod_colab)
BEGIN
	/* Atualizar o número de compras do cliente anterior */
	UPDATE colaborador
    SET numvendas = numvendas - 1
   	WHERE cpf = (SELECT cod_colab FROM deleted) 
	IF @@rowcount > 0 -- atualização do número de compras bem sucedida
  	BEGIN
		/* Atualizar o número de compras do cliente posterior */
		UPDATE colaborador
		SET numvendas = numvendas + 1
		WHERE cpf = (SELECT cod_colab FROM inserted) 
		IF @@rowcount = 0 -- atualização do número de compras mal sucedida
			rollback transaction
	END
	ELSE
		rollback transaction
END
GO

/***********************************************************
	ITEM DA NOTA FISCAL DE VENDA
***********************************************************/
/* a) Toda vez que um item de nota fiscal de venda for incluído, 
seja atualizada a quantidade em estoque do produto, valor total
da nota fiscal de venda e a comissao do colaborador; */
CREATE TRIGGER inclusaoitemvenda
ON itemnotafiscalvenda FOR INSERT
AS
	/* Atualizar valor total da nota fiscal de venda */
	UPDATE notafiscalvenda
    SET valortotal = valortotal + (SELECT i.quantidade * p.preco 
     	                           FROM produto p INNER JOIN inserted i 
            		                    ON p.codproduto = i.codproduto)
   	WHERE numnota = (SELECT numnota FROM inserted) 
	IF @@rowcount > 0 -- atualização do valor total bem sucedida
	BEGIN
		/* Atualizar a quantidade em estoque do produto */
		UPDATE produto
	  	SET qtdestoque = qtdestoque - (SELECT quantidade FROM inserted)
	  	WHERE codproduto = (SELECT codproduto FROM inserted)
	  	IF @@rowcount > 0 -- atualização do estoque bem sucedida
		  	/* Atualizar a comissao do colaborador */
			UPDATE colaborador
			SET comissao = comissao + (SELECT i.quantidade * p.preco 
     	                           		FROM produto p INNER JOIN inserted i 
            		                    ON p.codproduto = i.codproduto) * 0.01
			WHERE cpf = (SELECT n.cod_colab
						FROM inserted i INNER JOIN notafiscalvenda n 
						ON i.numnota = n.numnota)
			IF @@rowcount = 0 -- atualização da comissao do colaborador mal sucedida
	  			rollback transaction
	END
	ELSE
  	   rollback transaction
GO

/* b) Toda vez que um item de nota fiscal de venda for excluído, 
seja atualizada a quantidade em estoque do produto e o valor total
da nota fiscal de venda e a comissao do colaborador; */
CREATE TRIGGER exclusaoitemvenda
ON itemnotafiscalvenda FOR DELETE
AS 
   	/* Atualizar valor total da nota fiscal de venda */
	UPDATE notafiscalvenda
    SET valortotal = valortotal - (SELECT d.quantidade * p.preco 
     	                           FROM produto p INNER JOIN deleted d
            		                    ON p.codproduto = d.codproduto)
   	WHERE numnota = (SELECT numnota FROM deleted)
	IF @@rowcount > 0 -- atualização do valor total bem sucedida
	BEGIN
		/* Atualizar a quantidade em estoque do produto */
		UPDATE produto
	  	SET qtdestoque = qtdestoque + (SELECT quantidade FROM deleted)
	  	WHERE codproduto = (SELECT codproduto FROM deleted)
	  	IF @@rowcount > 0 -- atualização do estoque bem sucedida
		  	/* Atualizar a comissao do colaborador */
	  		UPDATE colaborador
			SET comissao = comissao - (SELECT d.quantidade * p.preco 
     	                           		FROM produto p INNER JOIN deleted d
            		                    ON p.codproduto = d.codproduto) * 0.01
			WHERE cpf = (SELECT n.cod_colab
						FROM deleted d INNER JOIN notafiscalvenda n 
						ON d.numnota = n.numnota)
			IF @@rowcount = 0 -- atualização da comissao do colaborador mal sucedida
	  			rollback transaction
	END
	ELSE
  	   rollback transaction
GO

/* c) Toda vez que for alterada a quantidade de um item de nota fiscal de venda,
seja atualizada a quantidade em estoque do produto, o valor total da nota fiscal
e a comissao do colaborador; */
CREATE TRIGGER alteracaoitemvenda
ON itemnotafiscalvenda FOR UPDATE
AS 
IF UPDATE(quantidade)
BEGIN
	/* Atualizar valor total da nota fiscal de venda */
   	UPDATE notafiscalvenda
   	SET valortotal = valortotal + (SELECT p.preco * (i.quantidade - d.quantidade) 
                                   FROM produto p INNER JOIN inserted i                  
                                        ON p.codproduto = i.codproduto 
                                        INNER JOIN deleted d              
                                        ON i.codproduto = d.codproduto AND 
                                          i.numnota = d.numnota)
   	WHERE numnota = (SELECT numnota FROM inserted)
   	IF @@rowcount > 0 /* atualização do valor total bem sucedida */
	BEGIN
		/* Atualizar a quantidade em estoque do produto */
		UPDATE produto
		SET qtdestoque = qtdestoque - (SELECT i.quantidade - d.quantidade
									FROM inserted i INNER JOIN deleted d
											ON i.codproduto = d.codproduto AND 
											i.numnota = d.numnota)
		WHERE codproduto = (SELECT codproduto FROM inserted)
		IF @@rowcount > 0 /* atualização do estoque bem sucedida */
		BEGIN
			/* Atualizar a comissao do colaborador */
			UPDATE colaborador
			SET comissao = comissao + (SELECT p.preco * (i.quantidade - d.quantidade) 
                                   		FROM produto p INNER JOIN inserted i                  
                                        ON p.codproduto = i.codproduto 
                                        INNER JOIN deleted d              
                                        ON i.codproduto = d.codproduto AND 
                                          i.numnota = d.numnota) * 0.01
			WHERE cpf = (SELECT n.cod_colab
						FROM inserted i INNER JOIN notafiscalvenda n 
						ON i.numnota = n.numnota)
			IF @@rowcount = 0 -- atualização da comissao do colaborador mal sucedida
				rollback transaction
		END
		ELSE
			rollback transaction
	END
	ELSE
		rollback transaction
END
GO

/***********************************************************
	ITEM DA NOTA FISCAL DE COMPRA
***********************************************************/
/* a) Toda vez que um item de nota fiscal de compra for incluído, 
seja atualizada a quantidade em estoque do produto e o valor total
da nota fiscal de compra; */
CREATE TRIGGER inclusaoitemcompra
ON itemnotafiscalcompra FOR INSERT
AS
	/* Atualizar valor total da nota fiscal de compra */
	UPDATE notafiscalcompra
    SET valortotal = valortotal + (SELECT i.quantidade * p.preco 
     	                           FROM produto p INNER JOIN inserted i 
            		                    ON p.codproduto = i.codproduto)
   	WHERE numnota = (SELECT numnota FROM inserted) 
	IF @@rowcount > 0 -- atualização do valor total bem sucedida
	BEGIN
		/* Atualizar a quantidade em estoque do produto */
		UPDATE produto
	  	SET qtdestoque = qtdestoque + (SELECT quantidade FROM inserted)
	  	WHERE codproduto = (SELECT codproduto FROM inserted)
	  	IF @@rowcount = 0 -- atualização do estoque mal sucedida
	  		rollback transaction
	END
	ELSE
  	   rollback transaction
GO

/* b) Toda vez que um item de nota fiscal de compra for excluído, 
seja atualizada a quantidade em estoque do produto e o valor total
da nota fiscal de compra; */
CREATE TRIGGER exclusaoitemcompra
ON itemnotafiscalcompra FOR DELETE
AS 
   	/* Atualizar valor total da nota fiscal de compra */
	UPDATE notafiscalcompra
    SET valortotal = valortotal - (SELECT d.quantidade * p.preco 
     	                           FROM produto p INNER JOIN deleted d
            		                    ON p.codproduto = d.codproduto)
   	WHERE numnota = (SELECT numnota FROM deleted)
	IF @@rowcount > 0 -- atualização do valor total bem sucedida
	BEGIN
		/* Atualizar a quantidade em estoque do produto */
		UPDATE produto
	  	SET qtdestoque = qtdestoque - (SELECT quantidade FROM deleted)
	  	WHERE codproduto = (SELECT codproduto FROM deleted)
	  	IF @@rowcount = 0 -- atualização do estoque mal sucedida
	  		rollback transaction
	END
	ELSE
  	   rollback transaction
GO

/* c) Toda vez que for alterada a quantidade de um item de nota fiscal de compra,
seja atualizada a quantidade em estoque do produto e o valor total da nota fiscal; */
CREATE TRIGGER alteracaoitemcompra
ON itemnotafiscalcompra FOR UPDATE
AS 
IF UPDATE(quantidade)
BEGIN
	/* Atualizar valor total da nota fiscal de compra */
   	UPDATE notafiscalcompra
   	SET valortotal = valortotal + (SELECT p.preco * (i.quantidade - d.quantidade) 
                                   FROM produto p INNER JOIN inserted i                  
                                        ON p.codproduto = i.codproduto 
                                        INNER JOIN deleted d              
                                        ON i.codproduto = d.codproduto AND 
                                          i.numnota = d.numnota)
   	WHERE numnota = (SELECT numnota FROM inserted)
   	IF @@rowcount > 0 /* atualização do valor total bem sucedida */
    BEGIN
		/* Atualizar a quantidade em estoque do produto */
		UPDATE produto
		SET qtdestoque = qtdestoque + (SELECT i.quantidade - d.quantidade
									FROM inserted i INNER JOIN deleted d
											ON i.codproduto = d.codproduto AND 
											i.numnota = d.numnota)
		WHERE codproduto = (SELECT codproduto FROM inserted)
		IF @@rowcount = 0 /* atualização do estoque mal sucedida */
			rollback transaction
	END
	ELSE
	   rollback transaction
END
GO

/***********************************************************
	FATURA
***********************************************************/
/* a) Toda vez que uma fatura for paga (atualização da
data de pagamento), seja excluída da tabela fatura e 
incluída na tabela faturapaga. */
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

/*
DROP TRIGGER inclusaonotafiscalvenda, exclusaonotafiscalvenda, alteracaonotafiscalvendacli, alteracaonotafiscalvendacolab,
	inclusaoitemvenda, exclusaoitemvenda, alteracaoitemvenda, inclusaoitemcompra, exclusaoitemcompra, alteracaoitemcompra,
	inclusaofaturapaga
*/