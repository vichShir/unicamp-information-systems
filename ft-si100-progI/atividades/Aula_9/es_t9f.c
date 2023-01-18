#include<stdio.h>

// Determinar o valor do Vetor
int vetorSize;

void VetorOrdemCrescente(int *v);

int main ()
{
    // Coletar o valor do Vetor
    scanf("%d", &vetorSize);

    // Instanciar o vetor de acordo com o tamanho fornecido
    int vetor[vetorSize];
    // Coletar os valores para o vetor criado
    for (int i = 0; i < vetorSize; i++)
    {
        scanf("%d", &vetor[i]);
    }

    // Procedimento para determinar a ordem crescente do vetor
    VetorOrdemCrescente(vetor);

    // Exibir os valores máximo e mínimo
    printf("maior valor: %d\n", vetor[vetorSize - 1]);
    printf("menor valor: %d\n", vetor[0]);

    return 0;
}

void VetorOrdemCrescente(int *v)
{
    int temp;

    for (int j = vetorSize; j > 0; j--)
    {
        for (int i = 0; i < j; i++)
        {
            if (i+1 != vetorSize)
            {
                if (v[i] > v[i+1])
                {
                    temp = v[i];
                    v[i] = v[i+1];
                    v[i+1] = temp;
                }
            }
        }
    }
}