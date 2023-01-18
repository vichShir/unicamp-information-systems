/* Inserções no banco - DML */

/***********************************************************
    CLIENTE
***********************************************************/
/* Inserção de cliente */
DECLARE @ret INT
EXEC @ret = ins_cliente 1, 'Laís Isabella Sebastiana Alves', 'Rua 1° de Março, 220', '89107131194' , '19710501', 'laisisabellasebastianaalves-95@grupoaerius.com.br', '48993619667', 1
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 2, 'Milena Sandra Camila Ramos','Rua Dracena, 220', '81572635304' , '19540324', 'milenasandracamilaramos@grupoaerius.com.br', '11987680162', 2
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 3, 'Giovanni Paulo Levi Caldeira', 'Av. das Pamonhas, 51', '53034197896', '19971016', 'giovannipaulolevicaldeira-82@eletrolexeng.com.br', '11997984420', 3
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 4, 'Luís Kaique da Mota', 'Quadra Quarenta e Cinco, 396', '32830373456', '19960604', 'luiskaiquedamota_@doublesp.com.br', '91992522817', 4
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 5, 'Lorenzo Marcos Martin da Conceição', 'Rua 104', '19441358207', '19891031', 'lorenzomarcosmartindaconceicao-98@realbit.com.br', '63986251799', 5
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 6, 'Elisa Laís Fogaça', 'Rua Recanto Tranquilo, 09', '42078147010', '19990206', 'elisalaisfogaca..elisalaisfogaca@inovasom.com', '85998442572' , 6
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 7, 'Miguel Raul Ricardo Viana', 'Travessa Leonor Roque, 69', '04858106462', '19980506', 'miguelraulricardoviana_@oerlikon.com', '21981650336', 7
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_cliente 8, 'Kevin Raimundo Dias', 'Avenida da Vila operária, 218', '99149585813', '19960120', 'kkevinraimundodias@dmadvogados.com', '71986998085', 8
PRINT @ret
GO

/* Alteração de cliente */
DECLARE @ret INT
EXEC @ret = alt_cliente 1, 'Laís Isabella Sebastiana Alves', 'Av. 3° de Março, 220', '89107131194' , '19710501', 'laisisabellasebastianaalves@email.com', '48993619667', 1
PRINT @ret
GO

/* Exclusão de cliente */
DECLARE @ret INT
EXEC @ret = del_cliente 2, '81572635304'
PRINT @ret
GO

/***********************************************************
    COLABORADOR
***********************************************************/
/* Inserção de colaborador */
DECLARE @ret INT
EXEC @ret = ins_colaborador 9, 'Isadora Daniela Costa', 'Rua Waldemar Coêlho de Aguiar, 35', '01725187418', '19680304', 'isadora@demasi.com.br', '11985093305', 1, 3000, 10, 'isadora' , 'isa04' 
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_colaborador 10, 'Benício Jorge Almeida', 'Rua Waldemar Coêlho de Aguiar, 85', '83030871690', '19850506', 'beniciojorgealmeida@paulistadovale.org.br', '11987093308', 3, 3000, 10, 'benicio' , 'beni09'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret = ins_colaborador 11, 'Benedita Elaine da Rosa', 'Rua dos Viajantes, 35', '49649079530', '19680305', 'beneditaelainedarosa_@demasi.com.br', '31988112488', 2, 3000, 10, 'benedita' , 'bene02'
PRINT @ret
GO

/* Alteração de colaborador */
DECLARE @ret INT
EXEC @ret = alt_colaborador 9, 'Isadora Daniela Costa', 'Rua Waldemar Coêlho de Aguiar, 35', '01725187418', '19680323', 'isadora@demasi.com.br', '11994533289', 0, 3289, 0, 'gerente_isadora' , 'isa04' 
PRINT @ret
GO

/* Exclusão de colaborador */
DECLARE @ret INT
EXEC @ret = del_colaborador 10, '83030871690'
PRINT @ret
GO

/***********************************************************
    FORNECEDOR
***********************************************************/
/* Inserção de fornecedor */
DECLARE @ret INT
EXEC @ret = ins_fornecedor 12, 'Gabriel e Sara Music ME', 'Avenida Salim Farah Maluf', '62155912000190', 'Bruno Vitor Yago Nunes'
GO

DECLARE @ret INT
EXEC @ret = ins_fornecedor 13, 'Osvaldo e Cristiane Music Ltda', 'Rua Dama da Noite', '92252147000197', 'Maitê Elaine Lorena Jesus'
GO

/* Alteração de fornecedor */
DECLARE @ret INT
EXEC @ret = alt_fornecedor 12, 'Gabriel e Sara Music ME', 'Avenida Salim Farah Maluf', '62155912000190', 'Kevyn Vilela Piteira'
GO

/* Exclusão de fornecedor */
DECLARE @ret INT
EXEC @ret = del_fornecedor 13, '92252147000197'
GO

/***********************************************************
    INSTRUMENTO DE CORDA
***********************************************************/
/* Inserção de instrumento de corda */
DECLARE @ret INT
EXEC @ret =  ins_instrumento_corda 1, 'CONTRABAIXO 4C TAGIMA TJB 4 SPECIAL SERIES OWH', 1690.00, 8, 'Tagima', 'TJB-4', 3, 'Olympic white', 'Corda', 1.35, 4, 20, 'A', 'Elétrico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_corda 2, 'GUITARRA TAGIMA TG-530 FWH WOODSTOCK FROZEN WHITE', 1209.15, 14, 'Tagima', 'TG-530', 6, 'FROZEN WHITE', 'Corda', 1.05, 6, 22, 'A', 'Elétrico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_corda 3, 'VIOLINO YAMAHA V3SKA 1/2 COM CASE', 1923.26, 3, 'YAMAHA', 'Guarnieri', 3, 'Natural', 'Corda', 1.15, 4, NULL, 'A', 'Acústico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_corda 4, 'UKULELE SOPRANO MAHINA MA21-K SAPELE ACÚSTICO FOSCO NATURAL', 271.25, 18, 'MAHINA', 'MA21-K', 6, 'Natural Mahogany Satin', 'Corda', 0.75, 4, 17, 'N', 'Acústico'
PRINT @ret
GO

/* Alteração de instrumento de corda */
DECLARE @ret INT
EXEC @ret = alt_instrumento_corda 1, 'CONTRABAIXO 4C TAGIMA TJB 4 SPECIAL SERIES OWH', 1790.00, 8, 'Tagima', 'TJB-4', 3, 'Olympic white', 'Corda', 1.3, 4, 20, 'A', 'Elétrico'
PRINT @ret
GO

/* Exclusão de instrumento de corda */
DECLARE @ret INT
EXEC @ret = del_instrumento_corda 2
PRINT @ret
GO

/***********************************************************
    INSTRUMENTO DE PERCUSSÃO
***********************************************************/
/* Inserção de instrumento de percussão */
DECLARE @ret INT
EXEC @ret =  ins_instrumento_percussao 5, 'Caixa para Bateria MAPLE 14X8" MPML 4800B MB Mapex - Preto (Midnight Black) (MB)', 1729.00, 4, 'MAPEX', 'MPML 4800B', 12, 'Midnight Black', 'Percussão', 1.6, 14, 'Maple Shell', 'Acústico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_percussao 6, 'Cajon Elétrico Inclinado Comfort Fca4500 (Natural)', 959.00, 10, 'FSA', 'Fca4500', 6, 'Natural', 'Percussão', 6.8, 11, 'Madeira', 'Acústico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_percussao 7, 'Pandeirola Meia Lua ABS com Abafador Luen - Azul (AZ)', 79.00, 20, 'Luen', '40070', 3, 'Azul', 'Percussão', .7, 6, 'ABS', 'Acústico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_percussao 8, 'Afuche C/tampa Injetada Liverpool', 139.00, 15, 'Liverpool', 'AF PR', 3, 'Colorido', 'Percussão', .3, 4, 'Plástico', 'Acústico'
PRINT @ret
GO

/* Alteração de instrumento de percussão */
DECLARE @ret INT
EXEC @ret =  alt_instrumento_percussao 5, 'Caixa para Bateria MAPLE 14X8" MPML 4800B MB Mapex', 1729.00, 4, 'MAPEX', 'MPML 4800B', 6, 'Midnight Black', 'Percussão', 1.62, 14.1, 'Maple Shell', 'Acústico'
PRINT @ret
GO

/* Exclusão de instrumento de percussão */
DECLARE @ret INT
EXEC @ret =  del_instrumento_percussao 6
PRINT @ret
GO

/***********************************************************
    INSTRUMENTO DE TECLADO
***********************************************************/
/* Inserção de instrumento de teclas */
DECLARE @ret INT
EXEC @ret =  ins_instrumento_teclado 9, 'Teclado Go Keys 61 K Roland', 2759.00, 3, 'Roland', 'GO:KEYS', 6, 'Vermelho', 'Teclas', 3.9, 61, 128, 'S', 'Digital'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_teclado 10, 'Piano Acústico Kawai GX-2 Preto 88 Teclas com Pedal Triplo', 210419.91, 1, 'Kawai', 'GX-2', 60, 'Black Piano', 'Teclas', 380, 88, NULL, 'N', 'Acústico'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_teclado 11, 'Teclado Musical Juno DS 76 (preto) Roland - Preto (BK)', 9549.00, 1, 'Roland', 'Juno DS 76', 24, 'Black', 'Teclas', 6.9, 76, 128, 'S', 'Digital'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_teclado 12, 'PIANO DIGITAL CDP S350 Casio - Preto (BK)', 4590.00, 2, 'Casio', 'CDP S350', 12, 'Black', 'Teclas', 10.9, 88, 64, 'S', 'Digital'
PRINT @ret
GO

/* Alteração de instrumento de teclas */
DECLARE @ret INT
EXEC @ret =  alt_instrumento_teclado 9, 'Teclado Go Keys 61 Teclas - K Roland', 2939.00, 3, 'Roland', 'GO:KEYS', 6, 'Vermelho', 'Teclas', 3.9, 61, 128, 'S', 'Digital'
PRINT @ret
GO

/* Exclusão de instrumento de teclas */
DECLARE @ret INT
EXEC @ret =  del_instrumento_teclado 10
PRINT @ret
GO

/***********************************************************
    INSTRUMENTO DE SOPRO
***********************************************************/
/* Inserção de instrumento de sopro */
DECLARE @ret INT
EXEC @ret =  ins_instrumento_sopro 13, 'Gaita Diatônica Free Blues 7020a (La) Hering', 149.00, 10, 'Hering', '7020a', 6, 'Vermelho', 'Sopro', .3, 10, 'A', 'Plástico ABS'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_sopro 14, 'Saxofone Soprano Envelhecido SP502 VG Eagle', 4190.00, 2, 'Eagle', 'SP502 VG', 12, 'Golden', 'Sopro', 1.8, 1, 'F#', 'Aço'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_sopro 15, 'Flauta Doce Barroca Soprano Yrs-24b (Creme) Yamaha', 59.00, 17, 'Yamaha', 'Yrs-24b', 6, 'Creme', 'Sopro', .4, 1, 'C', 'Plástico ABS'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_instrumento_sopro 16, 'GAITA DIATÔNICA OZZY OSBOURNE SIGNATURE M666 (DO) Hohner', 899.00, 2, 'Hohner', 'M666', 3, 'Black', 'Sopro', .3, 10, 'C', 'Metal'
PRINT @ret
GO

/* Alteração de instrumento de sopro */
DECLARE @ret INT
EXEC @ret =  alt_instrumento_sopro 13, 'Gaita Diatônica Free Blues 7020a (La) Hering', 149.00, 10, 'Hering', '7020a', 3, 'Vermelho', 'Sopro', .35, 10, 'A', 'ABS'
PRINT @ret
GO

/* Exclusão de instrumento de sopro */
DECLARE @ret INT
EXEC @ret =  del_instrumento_sopro 14
PRINT @ret
GO

/***********************************************************
    ACESSÓRIO DE ENCORDOAMENTO
***********************************************************/
/* Inserção de acessório de encordoamento */
DECLARE @ret INT
EXEC @ret =  ins_acessorio_encordoamento 17, 'Encordoamento para Contrabaixo 0.45 Giannini', 80.3, 26, 'Giannini', 'Contrabaixo', 6, 'Encordoamento', 4, 'Aço', 'L', .45
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_encordoamento 18, 'Encordoamento Para Guitarra 0,10 Light Elixir 12052 10-46', 69.99, 7, 'Elixir', 'Guitarra', 3, 'Encordoamento', 6, 'Aço', 'L', .10
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_encordoamento 19, 'Conjunto De Cordas P/ Violino 4/4 Pirastro Chromcor', 132.89, 16, 'Pirastro', 'Violino', 3, 'Encordoamento', 4, 'Aço', NULL, NULL
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_encordoamento 20, 'Encordoamento Sg Ukulele Nylon Concerto', 15.94, 31, 'SG', 'Ukulele', 3, 'Encordoamento', 4, 'Nylon', 'L', .024
PRINT @ret
GO

/* Alteração de acessório de encordoamento */
DECLARE @ret INT
EXEC @ret =  alt_acessorio_encordoamento 17, 'Encordoamento para Contrabaixo .45 Giannini', 72.45, 26, 'Giannini', 'Contrabaixo', 3, 'Encordoamento', 4, 'Aço', 'L', .45
PRINT @ret
GO

/* Exclusão de acessório de encordoamento */
DECLARE @ret INT
EXEC @ret =  del_acessorio_encordoamento 18
PRINT @ret
GO

/***********************************************************
    ACESSÓRIO DE PEDAL
***********************************************************/
/* Inserção de acessório de pedal */
DECLARE @ret INT
EXEC @ret =  ins_acessorio_pedal 21, 'Pedal de Overdrive para Guitarra The Juicer Neil Zaza ANZ 1 Mooer', 849.00, 4, 'Mooer', 'ANZ 1', 6, 'Pedal', 'Overdrive', 'A', 9, 20
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_pedal 22, 'Pedal para Guitarra PH 3 Phaser Boss', 1129.00, 3, 'Boss', 'PH 3', 3, 'Pedal', 'Phaser', 'D', 9, 50
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_pedal 23, 'Pedal para Guitarra e Contrabaixo BF 3 Flanger Boss', 1219.00, 4, 'Boss', 'BF 3', 3, 'Pedal', 'Flanger', NULL, 9, 40
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_pedal 24, 'Pedal Equalizador para Contrabaixo GEB 7 Bass Equalizer Boss', 949.00, 5, 'Boss', 'GEB 7 Bass', 6, 'Pedal', 'Equalizer', NULL, 9, 12
PRINT @ret
GO

/* Alteração de acessório de pedal */
DECLARE @ret INT
EXEC @ret =  alt_acessorio_pedal 21, 'Pedal de Overdrive para Guitarra The Juicer Neil Zaza ANZ 1 Mooer', 1149.00, 4, 'Mooer', 'ANZ 1', 12, 'Pedal', 'Overdrive', 'A', 12, 20
PRINT @ret
GO

/* Exclusão de acessório de pedal */
DECLARE @ret INT
EXEC @ret =  del_acessorio_pedal 22
PRINT @ret
GO

/***********************************************************
    ACESSÓRIO DE PALHETA
***********************************************************/
/* Inserção de acessório de palheta */
DECLARE @ret INT
EXEC @ret =  ins_acessorio_palheta 25, 'Palheta Tortex 0.73mm Dunlop', 8.00, 14, 'Dunlop', 'Cordas', 3, 'Palheta', .73, 'Nylon' 
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_palheta 26, 'Palheta Tortex 0.71mm Dunlop', 8.00, 15, 'Dunlop', 'Cordas', 3, 'Palheta', .71, 'Nylon'
PRINT @ret
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_palheta 27, 'Palheta Tortex 1.5mm Dunlop', 10.00, 9, 'Dunlop', 'Cordas', 3, 'Palheta', 1.5, 'Nylon'
GO

DECLARE @ret INT
EXEC @ret =  ins_acessorio_palheta 28, 'Palheta Tortex 0.60mm Dunlop', 8.00, 12, 'Dunlop', 'Cordas', 3, 'Palheta', .60, 'Ultex'
PRINT @ret
GO

/* Alteração de acessório de palheta */
DECLARE @ret INT
EXEC @ret =  alt_acessorio_palheta 25, 'Palheta Tortex 0.73mm Dunlop', 8.00, 14, 'Dunlop', 'Tortex', 1, 'Palheta', .73, 'Nylon' 
PRINT @ret
GO

/* Exclusão de acessório de palheta */
DECLARE @ret INT
EXEC @ret =  del_acessorio_palheta 26
PRINT @ret
GO

/***********************************************************
    CASOS DE GENERALIZAÇÃO (EXCLUSÃO MÚTUA & SOBREPOSIÇÃO)
***********************************************************/
/* Inserindo novo cliente (pessoa física já cadastrada como colaborador) - Sobreposição de pessoa física */
DECLARE @ret INT
EXEC @ret = ins_cliente 11, 'Benedita Elaine da Rosa', 'Rua dos Viajantes, 35', '49649079530', '19680305', 'beneditaelainedarosa_@demasi.com.br', '31988112488', 0
PRINT @ret
GO

/* Inserindo novo colaborador (pessoa física já cadastrada como cliente) - Sobreposição de pessoa física */
DECLARE @ret INT
EXEC @ret = ins_colaborador 3, 'Giovanni Paulo Levi Caldeira', 'Av. das Pamonhas, 51', '53034197896', '19971016', 'giovannipaulolevicaldeira-82@eletrolexeng.com.br', '11997984420', 0, 2359.00, 0, 'giovanni_caldeira' , 'giovanni03'
PRINT @ret
GO

/* [NÃO PODE INSERIR] Inserindo novo cliente (pessoa já cadastrada como fornecedor) - Exclusão mútua de pessoa */
DECLARE @ret INT
EXEC @ret = ins_cliente 12, 'Gabriel e Sara Music ME', 'Avenida Salim Farah Maluf', '69403418451', '19790912', 'gabrielsaramusic@email.com.br', '19749128345', 0
PRINT @ret
GO

/* [NÃO PODE INSERIR] Inserindo novo colaborador (pessoa já cadastrada como fornecedor) - Exclusão mútua de pessoa */
DECLARE @ret INT
EXEC @ret = ins_colaborador 12, 'Gabriel e Sara Music ME', 'Avenida Salim Farah Maluf', '69403418451', '19790912', 'gabrielsaramusic@email.com.br', '19749128345', 0, 2769.00, 0, 'gabrielsaramusic' , 'gabrielsaramusic01'
PRINT @ret
GO

/* [NÃO PODE INSERIR] Inserindo novo fornecedor (pessoa já cadastrada como cliente) - Exclusão mútua de pessoa */
DECLARE @ret INT
EXEC @ret = ins_fornecedor 11, 'Benedita Elaine da Rosa', 'Rua dos Viajantes, 35', '56184220000177', 'Benedita Elaine da Rosa'
GO

/* [NÃO PODE INSERIR] Inserindo novo fornecedor (pessoa já cadastrada como colaborador) - Exclusão mútua de pessoa */
DECLARE @ret INT
EXEC @ret = ins_fornecedor 3, 'Giovanni Paulo Levi Caldeira', 'Av. das Pamonhas, 51', '73598324000147', 'Giovanni Paulo Levi Caldeira'
GO

/* [NÃO PODE INSERIR] Inserindo novo acessorio de encordoamento (produto já cadastrado como instrumento de corda) - Exclusão mútua de produto */
DECLARE @ret INT
EXEC @ret =  ins_acessorio_encordoamento 1, 'CONTRABAIXO 4C TAGIMA TJB 4 SPECIAL SERIES OWH', 1690.00, 8, 'Tagima', 'TJB-4', 3, 'Encordoamento', 4, 'Aço', 'L', .45
PRINT @ret
GO

/* [NÃO PODE INSERIR] Inserindo novo instrumento de corda (produto já cadastrado como acessorio de encordoamento) - Exclusão mútua de produto */
DECLARE @ret INT
EXEC @ret =  ins_instrumento_corda 17, 'Encordoamento para Contrabaixo 0.45 Giannini', 80.3, 26, 'Giannini', 'Contrabaixo', 6, 'Olympic white', 'Corda', 1.35, 4, 20, 'A', 'Elétrico'
PRINT @ret
GO

/***********************************************************
    NOTA FISCAL DE VENDA
***********************************************************/
/* Inserção de nota fiscal de venda */
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (1, 0, '2014-07-30', '04858106462', '01725187418')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (2, 0, '2014-02-13', '19441358207', '01725187418')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (3, 0, '2014-06-27', '32830373456', '49649079530')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (4, 0, '2015-01-24', '42078147010', '49649079530')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (5, 0, '2015-09-12', '49649079530', '53034197896')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (6, 0, '2015-01-03', '53034197896', '49649079530')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (7, 0, '2016-09-05', '89107131194', '01725187418')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (8, 0, '2016-01-21', '99149585813', '01725187418')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (9, 0, '2016-03-31', '19441358207', '53034197896')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (10, 0, '2017-09-21', '89107131194', '01725187418')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (11, 0, '2017-12-17', '99149585813', '01725187418')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (12, 0, '2018-10-12', '89107131194', '53034197896')
INSERT INTO notafiscalvenda (numnota, valortotal, data, cod_cli, cod_colab) VALUES (13, 0, '2018-08-22', '42078147010', '49649079530')

/* Alteração de nota fiscal de venda */
UPDATE notafiscalvenda SET cod_cli = '04858106462' WHERE numnota = 12
UPDATE notafiscalvenda SET cod_colab = '01725187418' WHERE numnota = 12

/* Exclusão de nota fiscal de venda */
DELETE notafiscalvenda WHERE numnota = 13

/***********************************************************
    ITEM DE NOTA FISCAL DE VENDA
***********************************************************/
/* NOTA FISCAL VENDA 01 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (1, 4, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (1, 20, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (1, 25, 10)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (1, 21, 1)

UPDATE itemnotafiscalvenda SET quantidade = 2 WHERE numnota = 1 AND codproduto = 20
UPDATE itemnotafiscalvenda SET quantidade = 5 WHERE numnota = 1 AND codproduto = 25

DELETE itemnotafiscalvenda WHERE numnota = 1 AND codproduto = 21

/* NOTA FISCAL VENDA 02 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (2, 25, 3)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (2, 27, 8)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (2, 28, 3)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (2, 17, 2)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (2, 13, 1)

/* NOTA FISCAL VENDA 03 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (3, 1, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (3, 20, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (3, 27, 1)

UPDATE itemnotafiscalvenda SET quantidade = 3 WHERE numnota = 3 AND codproduto = 20

/* NOTA FISCAL VENDA 04 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (4, 11, 1)

/* NOTA FISCAL VENDA 05 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (5, 3, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (5, 19, 3)

DELETE itemnotafiscalvenda WHERE numnota = 5 AND codproduto = 19

/* NOTA FISCAL VENDA 06 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (6, 8, 10)
UPDATE itemnotafiscalvenda SET quantidade = 15 WHERE numnota = 6 AND codproduto = 8

/* NOTA FISCAL VENDA 07 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (7, 21, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (7, 23, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (7, 24, 1)

/* NOTA FISCAL VENDA 08 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (8, 1, 1)

/* NOTA FISCAL VENDA 09 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (9, 17, 4)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (9, 27, 8)

/* NOTA FISCAL VENDA 10 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (10, 3, 2)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (10, 8, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (10, 24, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (10, 28, 6)

UPDATE itemnotafiscalvenda SET quantidade = 1 WHERE numnota = 10 AND codproduto = 3
DELETE itemnotafiscalvenda WHERE numnota = 10 AND codproduto = 24

/* NOTA FISCAL VENDA 11 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (11, 9, 1)

/* NOTA FISCAL VENDA 12 */
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (12, 11, 1)
INSERT INTO itemnotafiscalvenda (numnota, codproduto, quantidade) VALUES (12, 21, 1)

/***********************************************************
    NOTA FISCAL DE COMPRA
***********************************************************/
INSERT INTO notafiscalcompra (numnota, valortotal, data, cod_forn) VALUES (1, 0, '2016-01-03', 12)
INSERT INTO notafiscalcompra (numnota, valortotal, data, cod_forn) VALUES (2, 0, '2016-02-14', 12)
INSERT INTO notafiscalcompra (numnota, valortotal, data, cod_forn) VALUES (3, 0, '2016-03-08', 12)
INSERT INTO notafiscalcompra (numnota, valortotal, data, cod_forn) VALUES (4, 0, '2016-06-30', 12)

/***********************************************************
    ITEM DE NOTA FISCAL DE COMPRA
***********************************************************/
/* NOTA FISCAL COMPRA 01 */
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (1, 8, 20)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (1, 11, 1)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (1, 25, 40)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (1, 28, 100)

UPDATE itemnotafiscalcompra SET quantidade = 5 WHERE numnota = 1 AND codproduto = 11
UPDATE itemnotafiscalcompra SET quantidade = 30 WHERE numnota = 1 AND codproduto = 25

DELETE itemnotafiscalcompra WHERE numnota = 1 AND codproduto = 28

/* NOTA FISCAL COMPRA 02 */
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (2, 3, 5)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (2, 5, 2)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (2, 27, 100)

/* NOTA FISCAL COMPRA 03 */
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (3, 9, 3)

/* NOTA FISCAL COMPRA 04 */
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (4, 1, 3)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (4, 12, 1)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (4, 16, 11)
INSERT INTO itemnotafiscalcompra (numnota, codproduto, quantidade) VALUES (4, 27, 10)

DELETE itemnotafiscalcompra WHERE numnota = 4 AND codproduto = 27

/***********************************************************
    FATURA
***********************************************************/
/* NOTA FISCAL DE VENDA 01 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (1, '2014-08-30', NULL, 343.13, 1, NULL)
UPDATE fatura SET dtpagamento = '2014-07-30' WHERE numfatura = 1

/* NOTA FISCAL DE VENDA 02 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (2, '2014-03-13', NULL, 421.90, 2, NULL)
UPDATE fatura SET dtpagamento = '2014-02-26' WHERE numfatura = 2

/* NOTA FISCAL DE VENDA 03 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (3, '2014-07-27', NULL, 615.94, 3, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (4, '2014-08-27', NULL, 615.94, 3, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (5, '2014-09-27', NULL, 615.94, 3, NULL)
UPDATE fatura SET dtpagamento = '2014-06-27' WHERE numfatura = 3

/* NOTA FISCAL DE VENDA 04 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (6, '2015-02-24', NULL, 1591.50, 4, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (7, '2015-03-24', NULL, 1591.50, 4, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (8, '2015-04-24', NULL, 1591.50, 4, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (9, '2015-05-24', NULL, 1591.50, 4, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (10, '2015-06-24', NULL, 1591.50, 4, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (11, '2015-07-24', NULL, 1591.50, 4, NULL)
UPDATE fatura SET dtpagamento = '2015-01-26' WHERE numfatura = 6
UPDATE fatura SET dtpagamento = '2015-02-28' WHERE numfatura = 7

/* NOTA FISCAL DE VENDA 05 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (12, '2015-10-12', NULL, 961.63, 5, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (13, '2015-11-12', NULL, 961.63, 5, NULL)

/* NOTA FISCAL DE VENDA 06 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (14, '2015-02-03', NULL, 417.00, 6, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (15, '2015-03-03', NULL, 417.00, 6, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (16, '2015-04-03', NULL, 417.00, 6, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (17, '2015-05-03', NULL, 417.00, 6, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (18, '2015-06-03', NULL, 417.00, 6, NULL)
UPDATE fatura SET dtpagamento = '2015-01-03' WHERE numfatura = 14
UPDATE fatura SET dtpagamento = '2015-02-03' WHERE numfatura = 15
UPDATE fatura SET dtpagamento = '2015-03-03' WHERE numfatura = 16
UPDATE fatura SET dtpagamento = '2015-04-03' WHERE numfatura = 17

/* NOTA FISCAL DE COMPRA 01 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (19, '2016-02-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (20, '2016-03-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (21, '2016-04-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (22, '2016-05-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (23, '2016-06-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (24, '2016-07-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (25, '2016-08-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (26, '2016-09-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (27, '2016-10-03', NULL, 5076.50, NULL, 1)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (28, '2016-11-03', NULL, 5076.50, NULL, 1)
UPDATE fatura SET dtpagamento = '2016-01-03' WHERE numfatura = 19
UPDATE fatura SET dtpagamento = '2016-02-03' WHERE numfatura = 20
UPDATE fatura SET dtpagamento = '2016-02-03' WHERE numfatura = 21
UPDATE fatura SET dtpagamento = '2016-02-03' WHERE numfatura = 22

/* NOTA FISCAL DE COMPRA 02 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (29, '2016-03-14', NULL, 7037.15, NULL, 2)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (30, '2016-04-14', NULL, 7037.15, NULL, 2)
UPDATE fatura SET dtpagamento = '2016-02-14' WHERE numfatura = 29
UPDATE fatura SET dtpagamento = '2016-03-14' WHERE numfatura = 30

/* NOTA FISCAL DE COMPRA 03 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (31, '2016-04-08', NULL, 8817.00, NULL, 3)

/* NOTA FISCAL DE COMPRA 04 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (32, '2016-07-30', NULL, 3969.80, NULL, 4)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (33, '2016-08-30', NULL, 3969.80, NULL, 4)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (34, '2016-09-30', NULL, 3969.80, NULL, 4)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (35, '2016-10-30', NULL, 3969.80, NULL, 4)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (36, '2016-11-30', NULL, 3969.80, NULL, 4)
UPDATE fatura SET dtpagamento = '2016-06-30' WHERE numfatura = 32
UPDATE fatura SET dtpagamento = '2016-07-30' WHERE numfatura = 33
UPDATE fatura SET dtpagamento = '2016-08-30' WHERE numfatura = 34

/* NOTA FISCAL DE VENDA 07 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (37, '2016-10-05', NULL, 1658.50, 7, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (38, '2016-11-05', NULL, 1658.50, 7, NULL)

/* NOTA FISCAL DE VENDA 08 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (39, '2016-02-21', NULL, 1790.00, 8, NULL)
UPDATE fatura SET dtpagamento = '2016-01-21' WHERE numfatura = 39

/* NOTA FISCAL DE VENDA 09 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (40, '2016-04-30', NULL, 369.80, 9, NULL)
UPDATE fatura SET dtpagamento = '2016-03-31' WHERE numfatura = 40

/* NOTA FISCAL DE VENDA 10 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (41, '2017-10-21', NULL, 703.42, 10, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (42, '2017-11-21', NULL, 703.42, 10, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (43, '2017-12-21', NULL, 703.42, 10, NULL)
UPDATE fatura SET dtpagamento = '2017-09-21' WHERE numfatura = 41
UPDATE fatura SET dtpagamento = '2017-10-21' WHERE numfatura = 42

/* NOTA FISCAL DE VENDA 11 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (44, '2018-01-17', NULL, 2939.00, 11, NULL)

/* NOTA FISCAL DE VENDA 12 */
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (45, '2018-11-12', NULL, 1783.00, 12, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (46, '2018-12-12', NULL, 1783.00, 12, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (47, '2019-01-12', NULL, 1783.00, 12, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (48, '2019-02-12', NULL, 1783.00, 12, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (49, '2019-03-12', NULL, 1783.00, 12, NULL)
INSERT INTO fatura (numfatura, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn) VALUES (50, '2019-04-12', NULL, 1783.00, 12, NULL)
UPDATE fatura SET dtpagamento = '2018-10-12' WHERE numfatura = 45
UPDATE fatura SET dtpagamento = '2018-11-12' WHERE numfatura = 46
UPDATE fatura SET dtpagamento = '2018-12-12' WHERE numfatura = 47
UPDATE fatura SET dtpagamento = '2019-01-12' WHERE numfatura = 48
UPDATE fatura SET dtpagamento = '2019-02-12' WHERE numfatura = 49

/***********************************************************
	VIEWS - PESSOAS
***********************************************************/
/* Visualização dos clientes */
SELECT * FROM vw_clientes

/* Os 10 clientes que mais compraram */
SELECT TOP 10 * FROM vw_clientes
ORDER BY numcompras DESC

/* Visualização dos colaboradores */
SELECT * FROM vw_colabs

/* Os 10 colaboradores que mais venderam */
SELECT TOP 10 * FROM vw_colabs
ORDER BY numvendas DESC

/* Valor total recebido por colaborador */
SELECT codpessoa, nome, (salario + comissao) total_recebido
FROM vw_colabs

/* Visualização dos fornecedores */
SELECT * FROM vw_fornecedores

/* Número de compras por fornecedor */
SELECT codpessoa, nome, cnpj, count(codpessoa) numcompras
FROM vw_fornecedores
GROUP BY codpessoa, nome, cnpj

/* Valor total comprado por fornecedor */
SELECT codpessoa, nome, cnpj, sum(valortotal) valortotal_comprado
FROM vw_fornecedores
GROUP BY codpessoa, nome, cnpj

/***********************************************************
	VIEWS - PRODUTOS
***********************************************************/
/* Produtos nunca vendidos */
SELECT * FROM vw_prods_nunca_vendidos

/* Sumarização da quantidade vendida dos produtos */
SELECT * FROM vw_prods_sumarizado

/* Os 10 produtos mais vendidos */
SELECT TOP 10 * FROM vw_prods_sumarizado
ORDER BY total_vendido DESC

/***********************************************************
	VIEWS - VENDA
***********************************************************/
/* Sumarização do preço total de cada item da nota fiscal de venda */
SELECT * FROM vw_itens_notafiscalvenda

/* Faturas de vendas não pagas */
SELECT * FROM vw_faturasvendas_nao_pagas

/* Valor restante devido das faturas de cada nota fiscal de venda */
SELECT numnota, valortotal valortotal_nota, sum(valor) restante_devido
FROM vw_faturasvendas_nao_pagas
GROUP BY numnota, valortotal

/* Faturas de vendas pagas */
SELECT * FROM vw_faturasvendas_todas_pagas

/* Sumarização do valor total pago das faturas da nota fiscal de venda */
SELECT numnota, sum(valortotal) valorpago
FROM vw_faturasvendas_todas_pagas
GROUP BY numnota

/***********************************************************
	COMPRA
***********************************************************/
/* Sumarização do preço total de cada item da nota fiscal de compra */
SELECT * FROM vw_itens_notafiscalcompra

/* Faturas de compras não pagas */
SELECT * FROM vw_faturascompras_nao_pagas

/* Valor restante devido das faturas de cada nota fiscal de compra */
SELECT numnota, valortotal valortotal_nota, sum(valor) restante_devido
FROM vw_faturascompras_nao_pagas
GROUP BY numnota, valortotal

/* Faturas de compras pagas */
SELECT * FROM vw_faturascompras_todas_pagas

/* Sumarização do valor total pago das faturas da nota fiscal de compra */
SELECT numnota, sum(valortotal) valorpago
FROM vw_faturascompras_todas_pagas
GROUP BY numnota