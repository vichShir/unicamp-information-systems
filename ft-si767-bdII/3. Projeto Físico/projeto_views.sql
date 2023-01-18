/* VIEWS */

/***********************************************************
	PESSOAS
***********************************************************/
/* a) Listar codpessoa, nome e numcompras dos clientes */
CREATE VIEW vw_clientes
AS
SELECT p.codpessoa, p.nome, c.numcompras
FROM pessoa p INNER JOIN pessoa_fisica f
	ON p.codpessoa = f.codpessoa
	INNER JOIN cliente c
	ON f.cpf = c.cpf
GO

/* b) Listar codpessoa, nome, salario, comissao e numvendas dos colaboradores */
CREATE VIEW vw_colabs
AS
SELECT p.codpessoa, p.nome, c.salario, c.comissao, c.numvendas
FROM pessoa p INNER JOIN pessoa_fisica f
	ON p.codpessoa = f.codpessoa
	INNER JOIN colaborador c
	ON f.cpf = c.cpf
GO

/* c) Listar codpessoa, nome, endereço, cnpj e representante dos fornecedores */
CREATE VIEW vw_fornecedores
AS
SELECT p.codpessoa, p.nome, p.endereco, f.cnpj, f.representante, n.valortotal
FROM pessoa p INNER JOIN fornecedor f
	ON p.codpessoa = f.codpessoa
	INNER JOIN notafiscalcompra n
	ON f.codpessoa = n.cod_forn
GO

/***********************************************************
	PRODUTOS
***********************************************************/
/* d) Listar o codproduto, nome, qtdestoque, marca e modelo dos produtos que nunca foram vendidos. */
CREATE VIEW vw_prods_nunca_vendidos
AS
SELECT codproduto, nome, qtdestoque, marca, modelo
FROM produto
WHERE codproduto NOT IN (SELECT DISTINCT codproduto
						 FROM itemnotafiscalvenda)
GO                        

/* e) Para cada produto, sumarizar a quantidade vendida, resultando em
codproduto, nome, marca, modelo e quantidade total vendida. */
CREATE VIEW vw_prods_sumarizado
AS
SELECT p.codproduto, p.nome, p.marca, p.modelo, sum(i.quantidade) total_vendido
FROM produto p INNER JOIN itemnotafiscalvenda i
	ON p.codproduto = i.codproduto
GROUP BY p.codproduto, p.nome, p.marca, p.modelo
GO

/***********************************************************
	VENDA
***********************************************************/
/* f) Para cada nota fiscal de venda, listar o numnota, o valortotal, o nome, o preço dos produtos vinculados,
juntamente com a quantidade vendida e o valor vendido (quantidade * preço). */
CREATE VIEW vw_itens_notafiscalvenda
AS
SELECT n.numnota, n.valortotal, p.nome, p.preco, i.quantidade, (i.quantidade * p.preco) 'total_item'
FROM notafiscalvenda n INNER JOIN itemnotafiscalvenda i
	ON n.numnota = i.numnota
	INNER JOIN produto p
	ON p.codproduto = i.codproduto
GO

/* g) Para cada nota fiscal de venda, listar o numnota, o valortotal e para cada fatura vinculada ainda não paga
(dtpagamento com valor nulo), listar numfatura, dtvencimento e valor. */
CREATE VIEW vw_faturasvendas_nao_pagas
AS
SELECT n.numnota, n.valortotal, f.numfatura, f.dtvencimento, f.valor
FROM notafiscalvenda n INNER JOIN fatura f
	ON n.numnota = f.numnota_cli
WHERE dtpagamento is NULL
GO

/* h) Para cada nota fiscal de venda cujas faturas foram todas pagas, listar o numnota e o valor total. */
CREATE VIEW vw_faturasvendas_todas_pagas
AS
SELECT numnota, valortotal
FROM notafiscalvenda n INNER JOIN faturapaga f
	ON n.numnota = f.numnota_cli
GO

/***********************************************************
	COMPRA
***********************************************************/
/* i) Para cada nota fiscal de compra, listar o numnota, o valortotal, o nome, o preço dos produtos vinculados,
juntamente com a quantidade vendida e o valor vendido (quantidade * preço). */
CREATE VIEW vw_itens_notafiscalcompra
AS
SELECT n.numnota, n.valortotal, p.nome, p.preco, i.quantidade, (i.quantidade * p.preco) 'total_item'
FROM notafiscalcompra n INNER JOIN itemnotafiscalcompra i
	ON n.numnota = i.numnota
	INNER JOIN produto p
	ON p.codproduto = i.codproduto
GO

/* j) Para cada nota fiscal de compra, listar o numnota, o valortotal e para cada fatura vinculada ainda não paga
(dtpagamento com valor nulo), listar numfatura, dtvencimento e valor. */
CREATE VIEW vw_faturascompras_nao_pagas
AS
SELECT n.numnota, n.valortotal, f.numfatura, f.dtvencimento, f.valor
FROM notafiscalcompra n INNER JOIN fatura f
	ON n.numnota = f.numnota_forn
WHERE dtpagamento is NULL
GO

/* k) Para cada nota fiscal de compra cujas faturas foram todas pagas, listar o numnota e o valor total. */
CREATE VIEW vw_faturascompras_todas_pagas
AS
SELECT numnota, valortotal
FROM notafiscalcompra n INNER JOIN faturapaga f
	ON n.numnota = f.numnota_forn
GO

SELECT * FROM vw_clientes
SELECT * FROM vw_colabs
SELECT * FROM vw_fornecedores
SELECT * FROM vw_prods_nunca_vendidos
SELECT * FROM vw_prods_sumarizado
SELECT * FROM vw_itens_notafiscalvenda
SELECT * FROM vw_faturasvendas_nao_pagas
SELECT * FROM vw_faturasvendas_todas_pagas
SELECT * FROM vw_itens_notafiscalcompra
SELECT * FROM vw_faturascompras_nao_pagas
SELECT * FROM vw_faturascompras_todas_pagas

/*
DROP VIEW vw_clientes, vw_colabs, vw_fornecedores,
	-- Produtos
	vw_prods_nunca_vendidos, vw_prods_sumarizado,
	-- Vendas
	vw_itens_notafiscalvenda, vw_faturasvendas_nao_pagas, vw_faturasvendas_todas_pagas,
	-- Compras
	vw_itens_notafiscalcompra, vw_faturascompras_nao_pagas, vw_faturascompras_todas_pagas
*/