#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "headers/operacoes.h"
#include "headers/produtos.h"

void cadastrarProduto(Produto* produtos, int *n_produtos)
{
    int currentProduto = *n_produtos;
    Produto *newProduto = (produtos + currentProduto);

    system("cls||clear");
    printf("\t\tCADASTRO DE PRODUTOS\t\n\n");

    // Preencher ID
    printf("Preencha os dados do Produto (%d):\nID: ", currentProduto+1);
    scanf("%d", &newProduto->id);

    // Preencher Nome
    printf("Nome: ");
    newProduto->nome = getTextInput();

    // Preencher Categoria
    printf("Categoria: ");
    newProduto->categoria = getTextInput();

    // Preencher Quantidade
    printf("Quantidade: ");
    scanf("%d", &newProduto->quantidade);

    // Preencher Preco
    printf("Preco: ");
    scanf("%f", &newProduto->preco);

    *n_produtos += 1;
}

void atualizarProduto(Produto* produtos, int *n_produtos)
{
    /*===========================================================*/
    /*              ATUALIZAR DADOS DE PRODUTOS                  */
    /*===========================================================*/

    int _atualizaroque = 0;
    int _buscaID = -1;

    Produto *_produto;
    do
    {
        system("cls||clear");
        printf("\t\tATUALIZAR PRODUTOS\t\n");

        if(*n_produtos == 0)
        {
            printf("\nNao ha produtos cadastrados!\n");
            _atualizaroque = 6;
        }
        else
        {
            printf("\n 1. Atualizar Nome\n 2. Categoria\n 3. Quantidade\n 4. Preco\n 5. Excluir Produto\n 6. Retornar\n\n>> ");
            scanf("%d", &_atualizaroque);

            if(_atualizaroque >= 1 && _atualizaroque < 6)
            {
                printf("\nDigite o ID do produto: ");
                scanf("%d", &_buscaID);

                // Buscar produto
                _produto = buscarProduto(produtos, *n_produtos, _buscaID);
                if(_produto == NULL)
                {
                    printf("Mercadoria nao esta cadastrada!\nFaca seu cadastro no menu principal.\n");
                    break;
                }

                int confirmacao = 0;
                switch (_atualizaroque)
                {
                    case 1:
                        printf("Digite o novo nome do produto (%d):\n>> ", _produto->id);
                        _produto->nome = getTextInput();
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 2:
                        printf("Digite a nova categoria do produto (%d):\n>> ", _produto->id);
                        _produto->categoria = getTextInput();
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 3:
                        printf("Digite a nova quantidade do produto (%d):\n>> ", _produto->id);
                        scanf("%d", &_produto->quantidade);
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 4:
                        printf("Digite o novo pre?o do produto (%d):\n>> ", _produto->id);
                        scanf("%f", &_produto->preco);
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 5:
                        printf("Voce realmente deseja excluir o produto (%d)?\n", _produto->id);
                        printf(" 1. Sim\n 2. Nao\n\n>> ");
                        scanf("%d", &confirmacao);

                        // Excluir produto
                        if(confirmacao == 1)
                        {
                            int produtoPos = buscarPosProduto(produtos, *n_produtos, _buscaID);
                            excluirProduto(produtos, n_produtos, produtoPos);

                            printf("Exclusao feita com sucesso!");
                            waitUser();
                        }
                        break;
                }
            }
        }

    } while(_atualizaroque != 6);

    waitUser();
}

Produto* buscarProduto(Produto *produtos, int n_produtos, int chave)
{
    int produtoPos = buscarPosProduto(produtos, n_produtos, chave);
    if(produtoPos == -1)
        return NULL;
    else
        return (produtos+produtoPos);
}

Produto* buscarProdutoSemID(Produto *produtos, int n_produtos, char *categoria, char *nome)
{
    for(int i = 0; i < n_produtos; i++)
    {
        if(strcmp((produtos+i)->categoria, categoria) == 0 && strcmp((produtos+i)->nome, nome) == 0)
        {
            return (produtos+i);
        }
    }
    return NULL;
}

int buscarPosProduto(Produto *produtos, int n_produtos, int chave)
{
    for(int i = 0; i < n_produtos; i++)
    {
        if((produtos+i)->id == chave)
        {
            return i;
        }
        else if(i == n_produtos-1)
        {
            return -1;
        }
    }
}

void excluirProduto(Produto *produtos, int *n_produtos, int produtoPos)
{
    // Shift left do ultimo produto ate a pos do produto excluido
    for(int i = produtoPos; i < *n_produtos - 1; i++)
    {
        Produto *currentProduto = (produtos+i);
        Produto *nextProduto = (produtos+(i+1));

        currentProduto->id = nextProduto->id;
        strcpy((currentProduto->nome), (nextProduto->nome));
        strcpy((currentProduto->categoria), (nextProduto->categoria));
        currentProduto->quantidade = nextProduto->quantidade;
        currentProduto->preco = nextProduto->preco;
    }
    *n_produtos -= 1;
}

void imprimirProduto(Produto* produtos, int n_produtos)
{ 
    system("cls||clear");
    printf("\t\tCONSULTAR DADOS DE PRODUTOS\n\n");

    // Imprimir dados da memoria
    if(n_produtos == 0)
    {
        printf("Nenhum registro encontrado.\n");
    }
    else
    {
        for(int i = 0; i < n_produtos; ++i)
        {
            printf("\nRegistro Produto <%d>\n", i+1);

            printf("\tID:         %d\n", (produtos+i)->id);
            printf("\tNome:       %s\n", (produtos+i)->nome);
            printf("\tCategoria:  %s\n", (produtos+i)->categoria);
            printf("\tQuantidade: %d\n", (produtos+i)->quantidade);
            printf("\tPreco:    R$%.2f\n", (produtos+i)->preco);
        }
    }
    waitUser();
}