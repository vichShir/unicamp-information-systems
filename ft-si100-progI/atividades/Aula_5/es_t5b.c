#include<stdio.h>

int main ()
{
	int sales[10];
	float prices[10];

	int total_sales;
	float total_prices;

	// Armazenar os valores das vendas e somá-las numa variável
	for(int i = 0; i < 10; i++)
	{
		scanf("%d", &sales[i]);
		total_sales += sales[i];
	}

	// Armazenar os valores dos preços de cada produto e multiplicá-los pelos vendas
	for(int i = 0; i < 10; i++)
	{
		scanf("%f", &prices[i]);
		total_prices += (prices[i] * sales[i]);
	}


	printf("O lucro foi de %.3f e a quantidade de produtos vendidos foi de %d\n", total_prices, total_sales);

	return 0;
}