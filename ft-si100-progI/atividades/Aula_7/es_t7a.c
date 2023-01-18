#include<stdio.h>
#include<string.h>

int main ()
{
	char word[81];
	char word_inverted[81];
	int i, j = 0;
	fgets(word, 81, stdin);

	// Inverter a string
	for (i = strlen(word) - 2; i >= 0; i--)
	{
		word_inverted[j] = word[i];
		j++;
	}
	word_inverted[j] = '\0';

	puts(word_inverted);
	//printf("\n");

	return 0;
}