/*
 * Vendas Header - operacoes que tratam de compras/vendas
 */

#ifndef VENDAS_H_INCLUDED
#define VENDAS_H_INCLUDED
#include "structs.h"

void imprimirVendas(Venda*, int);
void realizarVenda(Cliente*, Produto*, Venda**, int, int, int*, int*);

#endif // VENDAS_H_INCLUDED