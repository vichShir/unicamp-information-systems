#include<stdio.h>

int main ()
{
	int x[10];
	int y[10];

	// Armazenar os valores do primeiro Vetor
	for (int i = 0; i < 10; i++)
		scanf("%d", &x[i]);

	// Armanzenar os valores do segundo Vetor
	for (int i = 0; i < 10; i++)
		scanf("%d", &y[i]);

	// Realizar a intercalação dos dois vetores
	for (int i = 0; i < 10; i++)
	{
		printf("%d|", x[i]);
		printf("%d|", y[i]);
	}

	printf("\n");

	return 0;
}