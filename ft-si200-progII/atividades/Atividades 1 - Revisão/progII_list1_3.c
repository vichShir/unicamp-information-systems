/*==================================================================*/
/*               Programa Exercício 3 - Estoque de Compras          */
/* -> Jônatas Goes da Silva - FT Unicamp                            */
/* -> Felipe Eduardo - FT Unicamp                                   */
/* -> Victor Yukio Shirasuna - FT Unicamp                           */
/*==================================================================*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
	int **produto, n_prod, i, j, **cliente, n_clientes; 

	printf("\t  Cadastro dos produtos\n");
			
	printf("\n-Produtos:\n\n");
	printf("Digite a quantidade de produtos a serem catalogados: ");
	scanf("%d", &n_prod);

//Alocaçao dinamica da matriz de produtos

	produto =  (int**) malloc(n_prod * sizeof(int*));
	
	for( i = 1; i <= n_prod; i++)
		produto[i] = (int*) malloc( 2 * sizeof(int));

//Preenchimento da matriz de produtos, codigo seguido por quantidade em estoque (ao inves de dois vetores)
	
	for( i = 1 ; i <= n_prod; i++)
	{
			printf("Digite o codigo do produto[%d]: ", i);
			scanf("%d", &produto[i][1]);
			
			printf("Digite a quantida em estoque do produto[%d]: ", i);
			scanf("%d", &produto[i][2]);
	}
	
	printf("\n-Clientes\n");
		
	printf("\nInsira a quantidade de clientes que realizarao a compra: ");
	scanf("%d", &n_clientes);

//Alocacao dinamica da matriz de clientes

	cliente =  (int**) malloc(n_clientes * sizeof(int*));
	
	for( i = 1; i <= n_clientes; i++)
		cliente[i] = (int*) malloc( 3 * sizeof(int));

//Preenchimento da matriz de clientes com Id, codigo do produto e quantidade desejada
	
	for(i = 1 ; i <= n_clientes; i++)
	{
		for( j = 1; j <= 3; j++)
		{
			printf("Digite os dados e pedidos do cliente [%d]: ", i);
			scanf("%d", &cliente[i][j]);
		}
	}

//Limpeza de Tela

	printf("\nCaso seja necessario, anote os dados, a tela sera reinicializada\nAperte qualquer tecla para continuar");
	getch();
	system("clear||cls");
	
//Verificacao dos pedidos
 
  for(i = 1; i <= n_clientes; i++)
  {
  		if(cliente[i][2] == produto[i][1])							//Se o codigo do produto requisitado pelo cliente existir, prossegue
  		{
  			if(cliente[i][3] <= produto[i][2])						//Se a quantidade de produtos requisitada pelo cliente for menor ou igual a existente na matriz de produtos
  				produto[i][2] -= cliente[i][3];						//A quantidade e reduzida na matriz de produtos
  				
  			else
  				printf("\nNao temos a mercadoria em estoque suficiente referente ao pedido do cliente: %d\n", cliente[i][1]);				
		}
		
		else
			printf("\nNao temos a mercadoria em estoque suficiente referente ao pedido do cliente: %d\n", cliente[i][1]);
  }
  
  printf("\n-Estoque Atualizado:\n\n");
  
  for(i = 1; i <= n_prod; i++)
  {
  		printf("-Produto: %d", produto[i][1]);
  		printf("\t-Quantidade: %d\n", produto[i][2]);
  }
  
return 0;
}

