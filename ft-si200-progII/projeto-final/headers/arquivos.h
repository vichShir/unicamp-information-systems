/*
 * Arquivos Header - todas as operacoes que tratam com arquivos
 */

#ifndef ARQUIVOS_H_INCLUDED
#define ARQUIVOS_H_INCLUDED
#include <stdio.h>
#include "structs.h"

#define ARQUIVO_CLIENTES_PATH "dados/clientes.dat"
#define ARQUIVO_PRODUTOS_PATH "dados/produtos.dat"
#define ARQUIVO_VENDAS_PATH "dados/vendas.dat"

// Cliente
Cliente* allocCliente(int);
Cliente* reallocCliente(Cliente*, int, int);
Cliente* lerArquivoClientes(int*, int*);
void armazenarCliente(Cliente*, int, int);

// Produto
Produto* allocProduto(int);
Produto* reallocProduto(Produto*, int, int);
Produto* lerArquivoProdutos(int*, int*);
void armazenarProduto(Produto*, int, int);

// Venda
Venda* allocVenda(int);
Venda* reallocVenda(Venda*, int);
Venda* lerArquivoVendas(int*, int*);
void armazenarVenda(Venda*, int, int);

#endif // ARQUIVOS_H_INCLUDED

