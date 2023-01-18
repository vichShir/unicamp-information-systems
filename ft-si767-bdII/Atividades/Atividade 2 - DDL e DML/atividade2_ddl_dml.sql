/* 1. Criação de todas as tabelas da Base de Dados - DDL */

CREATE TABLE motorista 
(
	codigo int NOT NULL,
	nome varchar(20) NOT NULL,
	nro_carteira smallint NOT NULL,
	hora_entrada time NOT NULL,
	hora_saida time NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE cliente 
(
	codigo int NOT NULL,
	rg char(9) NOT NULL,
	nome varchar(20) NOT NULL,
	endereco varchar(50) NOT NULL,
	PRIMARY KEY (codigo)
)
GO

CREATE TABLE veiculo
(
	placa char(7) NOT NULL,
	marca varchar(20) NOT NULL,
	cor varchar(10) NULL,
	PRIMARY KEY (placa)
)
GO

CREATE TABLE ocorrencia
(
	codigo int NOT NULL,
	end_busca varchar(50) NOT NULL,
	end_entrega varchar(50) NOT NULL,
	data date NOT NULL,
	distancia decimal NOT NULL,
	preco money NOT NULL,
	pago char(1) NOT NULL,
	cod_motorista int NOT NULL,
	cod_cliente int NOT NULL,
	placa char(7) NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (cod_motorista) REFERENCES motorista,
	FOREIGN KEY (cod_cliente) REFERENCES cliente,
	FOREIGN KEY (placa) REFERENCES veiculo
)
GO

CREATE INDEX ix_oco_mot
ON ocorrencia(cod_motorista)
GO

CREATE INDEX ix_oco_cli
ON ocorrencia(cod_cliente)
GO

CREATE INDEX ix_oco_pla
ON ocorrencia(placa)
GO

-- DROP TABLE ocorrencia, veiculo, cliente, motorista

/* 2. DML */
/* Inserção de dados: INSERT */
INSERT INTO motorista
VALUES 
	(1, 'Augusto', 121, '06:34', '13:00'),
	(2, 'Beatriz', 122, '06:00', '18:30'),
	(3, 'Carlos', 123, '05:20', '12:30'),
	(4, 'Denise', 124, '05:01', '13:01'),
	(5, 'Eduardo', 125, '07:08', '12:00')

INSERT INTO cliente
VALUES 
	(1, '123456781', 'Amanda', 'Av. Das Nacoes, 578'),
	(2, '123456782', 'Bernando', 'Rua Dos Tomates, 32'),
	(3, '123456783', 'Carla', 'Av. Da Alegria, 1078'),
	(4, '123456784', 'Daniel', 'Av. Interessante, 70')

INSERT INTO veiculo
VALUES 
	('AAA1111', 'Ford', 'Prata'),
	('AAA2222', 'GM', 'Preto'),
	('AAA3333', 'Toyota', 'Azul'),
	('AAA4444', 'Renault', 'Prata'),
	('AAA5555', 'Honda', 'Vermelho')

INSERT INTO ocorrencia
VALUES 
	(1, 'Av. Das Nacoes, 578', 'Rua da Pamonha, 71', '20210903', 6.57, 740.0, 'S', 1, 2, 'AAA1111'),
	(2, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210903', 8.14, 950.0, 'N', 2, 1, 'AAA2222'),
	(3, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210903', 10.80, 1200.0, 'N', 5, 3, 'AAA3333'),
	(4, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210828', 2.56, 400.0, 'S', 3, 2, 'AAA4444'),
	(5, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210822', 1.09, 270.0, 'S', 4, 4, 'AAA5555'),
	(6, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210816', 1.89, 300.0, 'S', 5, 3, 'AAA5555'),
	(7, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210801', 4.43, 500.0, 'N', 1, 4, 'AAA4444'),
	(8, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210713', 5.90, 600.0, 'S', 3, 1, 'AAA3333'),
	(9, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210728', 6.08, 800.0, 'S', 2, 2, 'AAA2222'),
	(10, 'Av. Das Nacoes, 578', 'Rua da Pamanha, 71', '20210728', 6.50, 860.0, 'N', 4, 3, 'AAA1111')

SELECT * FROM motorista
SELECT * FROM cliente
SELECT * FROM veiculo
SELECT * FROM ocorrencia

/* 2e) Atualizar o atributo pago para ‘S’ da ocorrência de código 10. */
UPDATE ocorrencia
SET pago = 'S'
WHERE codigo = 10

/* 2f) Atualizar a hora de saída para 18:00h do motorista de código 5. */
UPDATE motorista
SET hora_saida = '18:00'
WHERE codigo = 5

/* 2g) Remover todas as ocorrências de um certo período (escolher o período) que já foram pagas. */
DELETE FROM ocorrencia
WHERE data BETWEEN '20210816' AND '20210828' AND pago = 'S'

/* 2h) Remover o veículo de placa ‘AAA5555’. */
DELETE FROM veiculo
WHERE placa = 'AAA5555'

/* 2i) Listar os motoristas que trabalham no período das 6:00h às 13:00h. */
SELECT *
FROM motorista
WHERE hora_entrada = '6:00' AND hora_saida = '13:00'

/* 2j) Listar o número total de ocorrências já pagas (atributo pago = ‘S’). */
SELECT count(*)
FROM ocorrencia
WHERE pago = 'S'

/* 2k) Listar a data e a média de preço das ocorrências por data. */
SELECT data, avg(preco) 'Media Preco'
FROM ocorrencia
GROUP BY data

/* 2l) Listar o nome do cliente para todas as ocorrências que ainda não foram pagas (atributo pago = ‘N’). */
SELECT nome
FROM ocorrencia o INNER JOIN cliente c
	ON o.cod_cliente = c.codigo
WHERE pago = 'N'

/* 2m) Para todas as ocorrências, listar a placa do veículo, o nome do motorista que atendeu a ocorrência, a data e a
distância, ordenando o resultado pela data. */
SELECT v.placa, m.nome, o.data, o.distancia
FROM ocorrencia o INNER JOIN veiculo v
	ON o.placa = v.placa
	INNER JOIN motorista m
	ON o.cod_motorista = m.codigo
ORDER BY data

/* 2n) Para todas as ocorrências que ainda não foram pagas (atributo pago = ‘N’), listar o nome do cliente, o nome
do motorista, a data e o preço do serviço solicitado, ordenando o resultado pela data e nome do cliente. */
SELECT c.nome Cliente, m.nome Motorista, o.data, o.preco
FROM ocorrencia o INNER JOIN cliente c
	ON o.cod_cliente = c.codigo
	INNER JOIN motorista m
	ON o.cod_motorista = m.codigo
WHERE pago = 'N'
ORDER BY o.data, c.nome