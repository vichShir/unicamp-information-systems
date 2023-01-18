#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<locale.h>

typedef struct mercadoria
{
    int codigo;
    char descricao[100];
    int quantidade;
} Mercadoria;

void cadastrar_produto(Mercadoria**, int* n_produtos);
void pedir_produto(Mercadoria**, int* n_produtos);
void listar_produtos(Mercadoria**, int*);
void atualizar(Mercadoria**, int* n_produtos);

int main()
{
    setlocale(LC_ALL,"Portuguese");
    
    int resp, qntd_produtos = 0;      
    Mercadoria *produtos;

    do
    {
        printf("\tLoja de Mercadorias\n");
        printf("\n\tCadastrar novas Mercadorias\t(1)");
        printf("\n\tPedido de Mercadorias\t\t(2)");
        printf("\n\tListagem de Estoque\t\t(3)");
        printf("\n\tAtualização de dados\t\t(4)");
        printf("\n\tSair\t\t\t\t(5)\n");
        
        printf("Tela desejada: ");
        scanf("%d", &resp);

        switch(resp)
        {
            // Opcao de cadastrar
            case 1:
                cadastrar_produto(&produtos, &qntd_produtos);
                break;
            // Opcao de pedidos
            case 2:
                pedir_produto(&produtos, &qntd_produtos);
                break;
            // Opcao da listagem estoque
            case 3:
                listar_produtos(&produtos, &qntd_produtos);
                break;
            // Opcao de atualizar dados
            case 4:
                atualizar(&produtos, &qntd_produtos);
                break;
        }

        //limpeza de tela a cada execução
        
        system("cls||clear");
    }
    while(resp != 5);

    return 0;
}

void cadastrar_produto(Mercadoria **produtos, int *n_produtos)
{
    system("cls||clear");
    
    printf("\tCadastrar novas Mercadorias\t\n");
    
    //Verificar se eh a primeira execucao do programa
    if(*n_produtos == 0)
    {
        printf("Digite a quantidade de produtos a ser cadastrada: ");
        scanf("%d", &*n_produtos);

        //Alocacao dinamica com malloc
        *produtos = (Mercadoria*) malloc(*n_produtos * sizeof(Mercadoria));

        //Cadastramento de produtos
        for(int i = 0; i < *n_produtos; ++i)
        {
            printf("Preencha os dados da mercadoria (%d):\nCodigo: ", i+1);
            scanf("%d", &(*produtos+i)->codigo);

            printf("Descrição: ");
            scanf("%s", (*produtos+i)->descricao);
            
            printf("Quantidade: ");
            scanf("%d", &(*produtos+i)->quantidade);
        }
    }
    
    else
    {   
        int _qnt;
      	printf("Digite a quantidade de produtos a ser cadastrada: ");
        scanf("%d", &_qnt);
        
        *n_produtos += _qnt;
     		
      	//Alocacao dinamica com malloc
		    *produtos = (Mercadoria*) realloc(*produtos, *n_produtos * sizeof(Mercadoria));

        //Cadastramento de produtos 
        for(int i = (*n_produtos - _qnt); i < *n_produtos; ++i)
        {
            printf("Preencha os dados da mercadoria (%d):\nCodigo: ", i+1);
            scanf("%d", &(*produtos+i)->codigo);

            printf("Descrição: ");
            scanf("%s", (*produtos+i)->descricao);
            
            printf("Quantidade: ");
            scanf("%d", &(*produtos+i)->quantidade);
        }
    }

    getch();
}

void pedir_produto(Mercadoria **produtos, int *n_produtos)
{
    int cod, qntd, i = 0;
    
    system("cls||clear");

    printf("\tPedido de Mercadorias\t\n");

    printf("Código do produto desejado: ");
    scanf("%d", &cod);
    
    printf("Quantidade desejada da mercadoria: ");
    scanf("%d", &qntd);
    
    //Loop enquanto o codigo procurado nao for igual ao codigo pedido ou nao ser encontrado

    do
    {
        if((*produtos+i)->codigo == cod)            //se o codigo procurado for igual ao codigo pedido
        {
            if((*produtos+i)->quantidade >= qntd)   //se a quantidade desejada estiver disponivel
            {
                printf("Produto disponivel. A quantidade desejada foi retirada do estoque");
                (*produtos+i)->quantidade -= qntd;                                              //decrementa a qntd desejada   
            }
            else
                 printf("\nESTOQUE INSUFICIENTE DA MERCADORIA");
            break; 
        }
        else if (i >= (*n_produtos))
        {
            printf("MERCADORIA NAO CADASTRADA");
            break;
        } 

        i++; 
    }
    while((i <= (*n_produtos)) || ((*produtos+i)->codigo != cod));

    getch();
}

void listar_produtos(Mercadoria **produtos, int *n_produtos)
{
    system("cls||clear");

    printf("\tListagem de Estoque\t\t\n");

	for(int i = 0; i < *n_produtos; ++i)
    {
        printf("Mercadoria (%d)\n", i+1);
        printf("\tCodigo:\t%d\n", (*produtos+i)->codigo);
        printf("\tDescrição:\t%s\n", (*produtos+i)->descricao);
        printf("\tQuantidade:\t%d\n", (*produtos+i)->quantidade);
    }

    printf("Press [Enter] key to continue.\n");
    while(getchar()!='\n'); // option TWO to clean stdin
    getchar(); // wait for ENTE
}

void atualizar(Mercadoria **produtos, int *n_produtos)
{
  int _atualizaroque = 0, _buscacodigo;

  system("cls||clear");

  printf("\tAtualização de dados\t\t\n");

  printf("Atualizar\n1. Descrição\n2. Quantidade\n>> ");
  scanf("%d", &_atualizaroque);
  printf("\nDigite o código: ");
  scanf("%d", &_buscacodigo);

  for(int i = 0; i < *n_produtos; ++i)
  {
    if((*produtos+i)->codigo == _buscacodigo)
    {
      printf("Preencha os novos dados da mercadoria (%d):\n", i+1);
      
      // Atualizar a descricao da mercadoria
      if(_atualizaroque == 1)
      {
        printf("Descrição: ");
        scanf("%s", (*produtos+i)->descricao);
      }
      // Atualizar o estoque da mercadoria
      else if (_atualizaroque == 2)
      {
        printf("Quantidade: ");
        scanf("%d", &(*produtos+i)->quantidade); 
      }

      _atualizaroque = 3;
      printf("Atualização efetuada com sucesso!\n");
    }
    else if(i >= *n_produtos - 1 && _atualizaroque != 3)
    {
      printf("MERCADORIA NÃO CADASTRADA\n");
    }
  }

  getch();
}