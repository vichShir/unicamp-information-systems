#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main ()
{
    float* v;
    float x, res;
    int grau, n;

    // Coletar o grau do polinômio
    scanf("%d", &grau);

    // Criar o vetor dinamicamente alocado com os valores dos coeficientes
    n = grau + 1;
    v = (float*) malloc(n*sizeof(float));

    // Se houver algum erro com a alocação dinâmica, reportar o erro e interromper o programa
    if(v == NULL)
    {
        printf("Memoria insuficiente\n");
        return 1;
    }

    // Coletar os valores dos coeficientes do polinômio
    for (int i = 0; i < n; i++)
    {
        scanf("%f", &v[i]);
    }

    // Coletar o valor de x do polinômio
    scanf("%f", &x);

    // Realizar o cálculo do polinômio com o valor fornecido de x
    for (int i = 0; i < n; i++)
    {
        res += v[i] * pow(x, i);
    }
    // Imprimir o resultado
    printf("%.2f\n", res);

    return 0;
}