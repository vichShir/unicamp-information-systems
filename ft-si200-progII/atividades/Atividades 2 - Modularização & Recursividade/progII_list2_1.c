/*==================================================================*/
/*           Lista 2 Programa Exercício 1 - Recursividade           */
/* -> Jônatas Goes da Silva - FT Unicamp                            */
/* -> Felipe Eduardo - FT Unicamp                                   */
/* -> Victor Yukio Shirasuna - FT Unicamp                           */
/*==================================================================*/

#include <stdio.h>

// Funcoes com recursividade
int Somatorio(int n);
float SomatorioFrac(int n);
float SomFracFat(int n);
float Fat(int n);

#pragma region MAIN_FUNCTION
int main (void) 
{
	// Valor a ser processado
	int n;
	
	// Interface
	printf ("Calculo do vetorial\n");
	printf ("Digite um numero: ");
	scanf ("%d", &n);
	
	// Verificacao de execucao
	if(n < 1)
	{
		printf("Valor invalido!\n");
		return 0;
	}
	
	// Calculo do somatorio
	printf("a) S =\t%d\n", Somatorio(n));
	
	// Calculo do somatorio com fracao
	printf("b) S =\t%.4f\n", SomatorioFrac(n));
	
	// Calculo do somatorio com fracao de fatorial
	printf("c) S =\t%.4f\n", SomFracFat(n));
	  
	return 0;

}
#pragma endregion

#pragma region FUNCTIONS
int Somatorio(int n)
{
	// Condicao de parada em 1
	if(n == 1)
		return 1;
	else
		// Valor de n + (n - 1)
		return (n + Somatorio(n - 1));
}

float SomatorioFrac(int n)
{
	// Condicao de parada em 1
	if(n == 1)
		return 1;
	else
		// Valor de (1/n) + (1/n-1) + (1/n-2)... + 1
		return (1/(float)n + SomatorioFrac(n - 1));
}

float SomFracFat(int n)
{
	// Condicao de parada em 0
	if(n == 0)
		return 1;
	else
		// Valor de (1/n!) + (1/(n-1)!) + (1/(n-2)!)... + 1
		return (1/Fat(n) + SomFracFat(n - 1));
}

float Fat(int n) 
{
	// Condicao de parada em 1
	if (n == 1)
		return (1);
	else
		// Valor de n * (n - 1)
		return (n * Fat(n - 1));
}
#pragma endregion
