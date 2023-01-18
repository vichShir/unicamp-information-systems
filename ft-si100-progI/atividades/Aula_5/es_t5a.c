#include<stdio.h>

int main ()
{
	float notas[20];

	// Armazena as notas
	for (int i = 0; i < 20; i++)
		scanf("%f", &notas[i]);

	// Variáveis de controle para verificação
	float input;
	int exist = 0;

	while (1)
	{
		// Valor digitado para verificação
		scanf("%f", &input);

		// Se for digitado um valor negativo, encerrar o programa
		if (input < 0)
			break;

		// Percorrer pelas notas e verificar se corresponde ao valor digitado
		for (int i = 0; i < 20; i++)
		{
			if (input == notas[i])
			{
				exist = 1;
				break;
			}
		}

		// Verificação final
		exist == 1 ? printf("existe\n") : printf("nao existe\n");
		exist = 0;
	}

	return 0;
}