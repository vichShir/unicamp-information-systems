#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <conio.h>
#include <locale.h>
#include "headers/structs.h"
#include "headers/arquivos.h"
#include "headers/cliente.h"
#include "headers/produtos.h"
#include "headers/vendas.h"
#include "headers/operacoes.h"

int main()
{
    //===========================================================
    //             Sistema de Estoque de Loja de Jogos
    //===========================================================
    // Projeto desenvolvido pelos integrantes:
    // -> Jonatas Goes da Silva
    // -> Felipe Eduardo
    // -> Victor Yukio Shirasuna
    //===========================================================

    setlocale(LC_ALL, "Portuguese");

    int menuOption = 0, submenuOption = 0;
    int numClientes = 0, numProdutos = 0, numVendas = 0;
    int bufferClientes = 1, bufferProdutos = 1, bufferVendas = 1;

    Cliente *clientes;
    Produto *produtos;
    Venda *vendas;
    
    // Tentar trazer dados do disco para a memoria
    clientes = lerArquivoClientes(&numClientes, &bufferClientes);
    produtos = lerArquivoProdutos(&numProdutos, &bufferProdutos);
    vendas = lerArquivoVendas(&numVendas, &bufferVendas);
		
    /* Opcoes do Menu:
     * (1) - Tela de cadastro dos produtos ou clientes
     * (2) - Tela de consulta dos dados de produtos, clientes ou vendas
     * (3) - Tela de atualizacao dos dados de produtos ou clientes
     * (4) - Tela de compra de produtos
     * (5) - Encerra o programa
     * OBS.: Apos o encerramento de uso em cada tela, o usuario voltara para a tela principal
     */
    do
    {
        // Menu
        printf("====================================================\n");
        printf("\tSISTEMA DE ESTOQUE E COMPRA DE JOGOS\n");
        printf("====================================================\n");
        printf("Escolha uma opcao para prosseguir:\n\n");
        printf("1. Cadastrar\n2. Consultar\n3. Atualizar\n4. Comprar\n5. Sair\n\n>> ");

        scanf("%d", &menuOption);
        switch (menuOption)
        {
            // Cadastro
            case 1:
                do
                {
                    system("cls||clear");

                    // Submenu de Cadastro
                    printf("\t\tCADASTRO\n\n");
                    printf("Escolha uma opcao para prosseguir:\n");
                    printf("1. Clientes\n2. Produtos\n3. Retornar\n\n>> ");
                    scanf("%d", &submenuOption);

                    char _userInput;
                    if(submenuOption == 1)
                    {
                        do
                        {
                            // Buffer cheio
                            if(numClientes == (bufferClientes * BUFFER_SIZE))
                            {
                                clientes = reallocCliente(clientes, numClientes, ++bufferClientes);
                                if(clientes == NULL)
                                {
                                    printf("\nERRO NA MEMORIA");
                                    return 55;
                                }
                            }
                            cadastrarCliente(clientes, &numClientes);
                            armazenarCliente(clientes, numClientes, bufferClientes); // Salvar no disco
                            printf("Deseja cadastrar mais clientes (S/N)?");
                            _userInput = getche();

                        } while(toupper(_userInput) == 'S');
                        system("cls||clear");
                    }
                    else if(submenuOption == 2)
                    {
                        do
                        {
                            // Buffer cheio
                            if(numProdutos == (bufferProdutos * BUFFER_SIZE))
                            {
                                produtos = reallocProduto(produtos, numProdutos, ++bufferProdutos);
                                if(produtos == NULL)
                                {
                                    printf("\nERRO NA MEMORIA");
                                    return 55;
                                }
                            }
                            cadastrarProduto(produtos, &numProdutos);
                            armazenarProduto(produtos, numProdutos, bufferProdutos); // Salvar no disco
                            printf("Deseja cadastrar mais produtos (S/N)?");
                            _userInput = getche();
                            
                        } while(toupper(_userInput) == 'S');
                        system("cls||clear");
                    }
                } while(submenuOption != 3);
            	break;

            // Consulta
            case 2:
                do
                {
                    system("cls||clear");

                    // Submenu de Consulta
                    printf("\t\tCONSULTAR DADOS\n\n");
                    printf("Escolha uma opcao para prosseguir:\n");
                    printf("1. Clientes\n2. Produtos\n3. Vendas\n4. Retornar\n\n>> ");
                    scanf("%d", &submenuOption);

                    if(submenuOption == 1)      imprimirCliente(clientes, numClientes);
                    else if(submenuOption == 2) imprimirProduto(produtos, numProdutos);
                    else if(submenuOption == 3) imprimirVendas(vendas, numVendas);
                } while(submenuOption != 4);
            	break;

            // Alterar dados
            case 3:
                do
                {
                    system("cls||clear");

                    // Submenu de Atualizacao
                    printf("\t\tATUALIZAR DADOS\n\n");
                    printf("Escolha uma opcao para prosseguir:\n");
                    printf("1. Clientes\n2. Produtos\n3. Retornar\n\n>> ");
                    scanf("%d", &submenuOption);

                    if(submenuOption == 1)
                    {
                        atualizarCliente(clientes, &numClientes);
                        armazenarCliente(clientes, numClientes, bufferClientes); // Salvar no disco
                    }
                    else if(submenuOption == 2)
                    {
                        atualizarProduto(produtos, &numProdutos);
                        armazenarProduto(produtos, numProdutos, bufferProdutos); // Salvar no disco
                    }
                } while(submenuOption !=3);
            	break;

            // Realizar venda
            case 4:
                realizarVenda(clientes, produtos, &vendas, numClientes, numProdutos, &numVendas, &bufferVendas);
                // Salvar em disco a cada 3 registros
                if((numVendas % 3) == 0)
                {
                    armazenarVenda(vendas, numVendas, bufferVendas);
                    armazenarProduto(produtos, numProdutos, bufferProdutos);
                }
            	break;
        }
        system("cls||clear");
    } while(menuOption != 5);

    // Salvar os ultimos registros remascentes de vendas
    if((numVendas % 3) != 0)
    {
        armazenarVenda(vendas, numVendas, bufferVendas);
        armazenarProduto(produtos, numProdutos, bufferProdutos);
    }
    
	free(clientes);
    free(produtos);
    free(vendas);
    
    return 0;
}