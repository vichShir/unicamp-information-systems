#include<stdio.h>
#include<string.h>

int main ()
{
	char word_real[80];
	char word_test[80];
	int i, j = 0;
	scanf("%s", word_real);

	// Inverter a string
	for (i = strlen(word_real) - 1; i >= 0; i--)
	{
		word_test[j] = word_real[i];
		j++;
	}
	word_test[j] = '\0';

	// Verificar a equivalencia entre as duas strings
	if (strcasecmp(word_test, word_real) != 0)
		printf("Esta palavra nao e um palindromo\n");
	else
		printf("Esta palavra e um palindromo\n");

	return 0;
}