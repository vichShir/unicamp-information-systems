#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "headers/operacoes.h"
#include "headers/cliente.h"

void cadastrarCliente(Cliente *clientes, int *n_clientes)
{
	int currentCliente = *n_clientes;
    Cliente *newCliente = (clientes + currentCliente);
	
    system("cls||clear");
    printf("\t\tCADASTRO DE CLIENTES\t\n\n");

    // Preencher ID
    printf("Preencha os dados do Cliente (%d):\nID: ", currentCliente+1);
    scanf("%d", &newCliente->id);

    // Preencher CPF
    printf("CPF: ");
    scanf("%d", &newCliente->cpf);

    // Preencher Nome
    printf("Nome: ");
    newCliente->nome = getTextInput();

    // Preencher endereco
    printf("Endereco: ");
    newCliente->endereco = getTextInput();
    
    // Preencher email
    printf("Email: ");
    newCliente->email = getTextInput();
    
    *n_clientes += 1;
}

void atualizarCliente(Cliente* clientes, int *n_clientes)
{
    /*===========================================================*/
    /*              ATUALIZAR DADOS DE CLIENTES                  */
    /*===========================================================*/

    int _atualizaroque = 0;
    int _buscaID = -1;

    Cliente *_cliente;
    do
    {
        system("cls||clear");
        printf("\t\tATUALIZAR CLIENTES\n");

        if(*n_clientes == 0)
        {
            printf("\nNao ha clientes cadastrados!\n");
            _atualizaroque = 6;
        }
        else
        {
            printf("\n 1. Atualizar Nome\n 2. Atualizar CPF\n 3. Atualizar Endereco\n 4. Atualizar Email\n 5. Excluir Cliente\n 6. Retornar\n\n>> ");
            scanf("%d", &_atualizaroque);

            // Quebra o loop e volta para o inicio
            if(_atualizaroque >= 1 && _atualizaroque < 6)
            {
                printf("\nDigite o ID do Cliente: ");
                scanf("%d", &_buscaID);

                // Buscar cliente
                _cliente = buscarCliente(clientes, *n_clientes, _buscaID);
                if(_cliente == NULL)
                {
                    printf("Usuario nao esta cadastrado!\nFaca seu cadastro no menu principal.\n");
                    break;
                }

                int confirmacao = 0;
                switch (_atualizaroque)
                {
                    case 1:
                        printf("Digite o novo nome do cliente (%d):\n>> ", _cliente->id);
                        _cliente->nome = getTextInput();
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 2:
                        printf("Digite o novo CPF do cliente (%d):\n>> ", _cliente->id);
                        scanf("%d", &_cliente->cpf);
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 3:
                        printf("Digite o novo endereco do cliente (%d):\n>> ", _cliente->id);
                        _cliente->endereco = getTextInput();
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 4:
                        printf("Digite o novo email do cliente (%d):\n>> ", _cliente->id);
                        _cliente->email = getTextInput();
                        printf("Atualizacao feita com sucesso!\n");
                        waitUser();
                        break;

                    case 5:
                        printf("Voce realmente deseja excluir o cliente (%d)?\n", _cliente->id);
                        printf(" 1. Sim\n 2. Nao\n\n>> ");
                        scanf("%d", &confirmacao);

                        // Excluir cliente
                        if(confirmacao == 1)
                        {
                            int clientePos = buscarPosCliente(clientes, *n_clientes, _buscaID);
                            excluirCliente(clientes, n_clientes, clientePos);

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

Cliente* buscarCliente(Cliente *clientes, int n_clientes, int chave)
{
    int clientePos = buscarPosCliente(clientes, n_clientes, chave);
    if(clientePos == -1)
        return NULL;
    else
        return (clientes+clientePos);
}

int buscarPosCliente(Cliente *clientes, int n_clientes, int chave)
{
    for(int i = 0; i < n_clientes; i++)
    {
        if((clientes+i)->id == chave)
        {
            return i;
        }
        else if(i == n_clientes-1)
        {
            return -1;
        }
    }
}

void excluirCliente(Cliente *clientes, int *n_clientes, int clientePos)
{
    // Shift left do ultimo cliente ate a pos do cliente excluido
    for(int i = clientePos; i < *n_clientes - 1; i++)
    {
        Cliente *currentCliente = (clientes+i);
        Cliente *nextCliente = (clientes+(i+1));

        currentCliente->id = nextCliente->id;
        currentCliente->cpf = nextCliente->cpf;
        strcpy((currentCliente->nome), (nextCliente->nome));
        strcpy((currentCliente->endereco), (nextCliente->endereco));
        strcpy((currentCliente->email), (nextCliente->email));
    }
    *n_clientes -= 1;
}

void imprimirCliente(Cliente* clientes, int n_clientes)
{
    system("cls||clear");
    printf("\t\tCONSULTAR DADOS DE CLIENTES\n\n");

    // Imprimir dados da memoria
    if(n_clientes == 0)
    {
        printf("Nenhum registro encontrado.\n");
    }
    else
    {
        for(int i = 0; i < n_clientes; i++)
        {
            printf("\nRegistro Cliente <%d>\n", i+1);

            printf("\tID:       %d\n", (clientes+i)->id);
            printf("\tCPF:      %d\n", (clientes+i)->cpf);
            printf("\tNome:     %s\n", (clientes+i)->nome);
            printf("\tEndereco: %s\n", (clientes+i)->endereco);
            printf("\tEmail:    %s\n", (clientes+i)->email);
        }
    }
    waitUser();
}