/*
 * Cliente Header - todas as opera??es que tratam com clientes
 */

#ifndef CLIENTE_H_INCLUDED
#define CLIENTE_H_INCLUDED
#include "structs.h"

void cadastrarCliente(Cliente*, int*);
char* getTextInput();
void atualizarCliente(Cliente*, int*);
Cliente* buscarCliente(Cliente*, int, int);
int buscarPosCliente(Cliente*, int, int);
void excluirCliente(Cliente*, int*, int);
void imprimirCliente(Cliente*, int);

#endif // CLIENTE_H_INCLUDED

