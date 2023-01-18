#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "headers/operacoes.h"
#include "headers/arquivos.h"
#include "headers/cliente.h"
#include "headers/produtos.h"

void imprimirVendas(Venda* vendas, int n_vendas)
{
    system("cls||clear");
    printf("\tCONSULTAR DADOS CADASTRAIS DAS VENDAS\n\n");

    // Imprimir dados da memoria
    if(n_vendas == 0)
    {
        printf("Nenhum registro encontrado.\n");
    }
    else
    {
        float _totalArrecadado = 0;
        for(int i = 0; i < n_vendas; ++i)
        {
            printf("\nRegistro Venda <%d>\n",   i+1);
            printf("\tID Cliente:     %d\n",    (vendas+i)->id_comprador);
            printf("\tCategoria Jogo: %s\n",    (vendas+i)->categoria);
            printf("\tNome Jogo:      %s\n",    (vendas+i)->nome);
            printf("\tQuantidade:     %d\n",    (vendas+i)->quantidade);
            printf("\tLucro:        R$%.2f\n",  (vendas+i)->lucro);
            _totalArrecadado += (vendas+i)->lucro;
        }

        printf("\nTotal arrecadado: R$%.2f\n", _totalArrecadado);
    }
    waitUser();
}

// Funcao de pedidos de compra, valida o usuario e produtos cadastrados (tudo em memoria)
void realizarVenda(Cliente* clientes, Produto* produtos, Venda** vendas, int n_clientes, int n_produtos, int* n_vendas, int* ctrl_vendasBuffer)
{
    /*===============================================================================*/
    /*                      ADQUIRIR PRODUTOS VALIDANDO:                             */
    /*   ID DO CLIENTE, NOME DA CATEGORIA DO PRODUTO, NOME DO PRODUTO E QUANTIDADE   */
    /*===============================================================================*/

    int _userID;
    int _inputProdQuantidade;
    char *_inputProdCategoria = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
    char *_inputProdNome = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));

    Cliente *cliente;
    Produto *produto;
    
    // Submenu
    system("cls||clear");
    printf("\tCOMPRAR PRODUTO\n\n");
    printf("Codigo do cliente:\n>> ");
    scanf("%d", &_userID);

    // Buscar cliente
    cliente = buscarCliente(clientes, n_clientes, _userID);
    if(cliente != NULL)
    {
        // Solicitar categoria do produto
        printf("Categoria do jogo:\n>> ");
        _inputProdCategoria = getTextInput();

        // Solicitar nome do produto
        printf("Nome do jogo:\n>> ");
        _inputProdNome = getTextInput();

        // Buscar produto
        produto = buscarProdutoSemID(produtos, n_produtos, _inputProdCategoria, _inputProdNome);
        if(produto != NULL)
        {
            // Solicitar quantidade do produto
            printf("Quantidade desejada:\n>> ");
            scanf("%d", &_inputProdQuantidade);

            if(produto->quantidade >= _inputProdQuantidade)
            {
                /* O produto esta disponivel! */
                printf("Produto disponivel. A quantidade desejada foi retirada do estoque\n");

                // Controles internos
                produto->quantidade -= _inputProdQuantidade;
                *n_vendas += 1;

                // Buffer cheio
                if(*n_vendas > (BUFFER_SIZE * (*ctrl_vendasBuffer)))
                {
                    *ctrl_vendasBuffer += 1;
                    *vendas = reallocVenda(*vendas, *ctrl_vendasBuffer);
                }

                // Criar venda
                Venda *novaVenda = (*vendas + (*n_vendas - 1));
                novaVenda->id_comprador = _userID;
                strcpy(novaVenda->categoria, produto->categoria);
                strcpy(novaVenda->nome, produto->nome);
                novaVenda->quantidade = _inputProdQuantidade;
                novaVenda->lucro = (produto->preco * _inputProdQuantidade);

                // Imprimir venda
                printf("\nRESUMO DA COMPRA:\n");
                printf("ID COMPRADOR:      %d\n", novaVenda->id_comprador);
                printf("CATEGORIA PRODUTO: %s\n", novaVenda->categoria);
                printf("NOME PRODUTO:      %s\n", novaVenda->nome);
                printf("QUANTIDADE:        %d\n", novaVenda->quantidade);
                printf("LUCRO:           R$%.2f\n", novaVenda->lucro);
            }
            else
            {
                printf("Produto fora de estoque!\n");
            }
        }
        else
        {
            printf("Produto nao encontrado!\n");
        }
    }
    else
    {
        printf("Usuario nao esta cadastrado!\nFaca seu cadastro no menu principal.\n");
    }
    waitUser();
}