#include<stdio.h>
#include<stdlib.h>

int main ()
{
    int i, j, n = 0;
    int** val;

    // Coletar o tamanho da Matriz
    scanf("%d %d", &i, &j);

    // Alocar dinamicamente a Matriz pelas colunas
    val = (int**) malloc(j*sizeof(int*));

    // Alocar dinamincamente a Matriz pelas linhas
    for (int k = 0; k < j; k++)
        val[k] = (int*) malloc(i*sizeof(int));

    // Se houver algum erro com a alocação dinâmica, reportar o erro e interromper o programa
    if(val == NULL)
    {
        printf("Memoria Insuficiente!");
        return 1;
    }

    // Coletar os valores da Matriz
    for (int k = 0; k < i; k++)
    {
        for (int l = 0; l < j; l++)
        {
            scanf("%d", &val[k][l]);
        }
    }

    // Contagem para determinar se a Matriz é simétrica
    for (int k = 0; k < i; k++)
    {
        for (int l = 0; l < j; l++)
        {
            if (val[k][l] == val[l][k])
                n++;
        }
    }

    // Verificação da contagem se é simétrica ou não
    if (n == i*j)
        printf("Eh simetrica\n");
    else
        printf("Nao eh simetrica\n");

    return 0;
}