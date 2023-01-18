# Projeto Lógico

Esquema lógico do banco de dados do sistema, modelado utilizando o Modelo Relacional, com a indicação de todas as restrições de integridade - chaves primárias, secundárias (se houver) e estrangeiras.

**pessoa = { <u>codpessoa</u>, nome, endereco }**

**fornecedor = { <u>codpessoa</u>, <u>cnpj</u>, representante }**

    codpessoa - chave estrangeira referenciando pessoa

**pessoa_fisica = { <u>codpessoa</u>, <u>cpf</u>, dtnascimento, email, telefone }**

    codpessoa - chave estrangeira referenciando pessoa

**cliente = { <u>cpf</u>, numcompras }**

    cpf - chave estrangeira referenciando pessoa_fisica

**colaborador = { <u>cpf</u>, numvendas, salario, comissao, login, senha }**

    cpf - chave estrangeira referenciando pessoa_fisica

**produto = { <u>codproduto</u>, nome, preco, qtdestoque, marca, modelo, garantia }**

**notafiscalvenda = { <u>numnota</u>, valortotal, data, cod_cli, cod_colab }**

    cod_cli - chave estrangeira referenciando cliente
    cod_colab - chave estrangeira referenciando colaborador

**itemnotafiscalvenda = { <u>numnota</u>, <u>codproduto</u>, quantidade }**

    numnota - chave estrangeira referenciando notafiscalvenda
    codproduto - chave estrangeira referenciando produto

**notafiscalcompra = { <u>numnota</u>, valortotal, data, cod_forn }**

    cod_forn - chave estrangeira referenciando fornecedor

**itemnotafiscalcompra = { <u>numnota</u>, <u>codproduto</u>, quantidade }**

    numnota - chave estrangeira referenciando notafiscalcompra
    codproduto - chave estrangeira referenciando produto

**fatura = { <u>numfatura</u>, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn }**

    numnota_cli - chave estrangeira referenciando notafiscalvenda
    numnota_forn  - chave estrangeira referenciando notafiscalcompra

**faturapaga = { <u>numfatura</u>, dtvencimento, dtpagamento, valor, numnota_cli, numnota_forn }**

    numnota_cli - chave estrangeira referenciando notafiscalvenda
    numnota_forn  - chave estrangeira referenciando notafiscalcompra

**instrumento = { <u>codproduto</u>, cor, tipoinstrumento, peso }**

    codproduto = chave estrangeira referenciando produto

**acessorio = { <u>codproduto</u>, tipoacessorio }**

    codproduto = chave estrangeira referenciando produto

**corda = { <u>codproduto</u>, numcordas, numtrastes, tipocorda, sonoridade }**

    codproduto = chave estrangeira referenciando instrumento

**percussao = { <u>codproduto</u>, tampolegadas, material, sonoridade }**

    codproduto = chave estrangeira referenciando instrumento

**teclado = { <u>codproduto</u>, numteclas, polifoniamax, metronomo, sonoridade }**

    codproduto = chave estrangeira referenciando instrumento

**sopro = { <u>codproduto</u>, numfurosbocal, afinacao, acabamentoboquilha }**

    codproduto = chave estrangeira referenciando instrumento

**encordoamento = { <u>codproduto</u>, numcordas, material, escala, tensao }**

    codproduto = chave estrangeira referenciando acessorio 

**pedal = { <u>codproduto</u>, tipopedal, digitalanalogico, tensaoalimentacao, consumoenergia }**

    codproduto = chave estrangeira referenciando acessorio 

**palheta = { <u>codproduto</u>, espessura, material }**

    codproduto = chave estrangeira referenciando acessorio