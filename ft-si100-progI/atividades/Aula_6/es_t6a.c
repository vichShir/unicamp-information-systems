#include<stdio.h>

int main ()
{
	int NUM_LIM, NUM_COL;
	int aux = 0;

	// Determinar o tamanho da Matriz
	scanf("%d %d", &NUM_LIM, &NUM_COL);

	// Criar a Matriz de acordo com o tamanho fornecido
	int matrix[NUM_LIM][NUM_COL];

	// Coletar os valores da Matriz
	for (int i = 0; i < NUM_LIM; i++)
		for (int k = 0; k < NUM_COL; k++)
			scanf("%d", &matrix[i][k]);

	// Imprimir a transposta da Matriz
	for (int k = 0; k < NUM_COL; k++)
	{
		for (int i = 0; i < NUM_LIM; i++)
		{
			if (k != aux)
				printf("\n");

			printf("%d ", matrix[i][k]);
			aux = k;
		}
	}

	printf("\n");

	return 0;
}