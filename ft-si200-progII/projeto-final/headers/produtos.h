/*
 * Produtos Header - todas as opera??es que tratam com produtos
 */

#ifndef PRODUTOS_H_INCLUDED
#define PRODUTOS_H_INCLUDED
#include "structs.h"

void cadastrarProduto(Produto*, int*);
void atualizarProduto(Produto*, int*);
Produto* buscarProduto(Produto*, int, int);
Produto* buscarProdutoSemID(Produto*, int, char*, char*);
int buscarPosProduto(Produto*, int, int);
void excluirProduto(Produto*, int*, int);
void imprimirProduto(Produto*, int);

#endif // PRODUTOS_H_INCLUDED