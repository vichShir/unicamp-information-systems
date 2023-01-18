#include<stdio.h>
#include<math.h>

float CalculadoraSoma (float n1, float n2);
float CalculadoraSubtracao (float n1, float n2);
float CalculadoraMultiplicacao (float n1, float n2);
float CalculadoraDivisao (float n1, float n2);
float CalculadoraPower (float n1, float n2);

int main ()
{
    char op;
    float n1, n2;

    scanf("%f", &n1);
    scanf("%c", &op);
    scanf("%f", &n2);

    switch (op)
    {
    case '+':
        printf("%.3f\n", CalculadoraSoma(n1, n2));
        break;
    case '-':
        printf("%.3f\n", CalculadoraSubtracao(n1, n2));
        break;
    case '*':
        printf("%.3f\n", CalculadoraMultiplicacao(n1, n2));
        break;
    case '/':
        printf("%.3f\n", CalculadoraDivisao(n1, n2));
        break;
    case '^':
        printf("%.3f\n", CalculadoraPower(n1, n2));
        break;
    }

    return 0;
}

float CalculadoraSoma (float n1, float n2)
{
    return n1 + n2;
}

float CalculadoraSubtracao (float n1, float n2)
{
    return n1 - n2;
}

float CalculadoraMultiplicacao (float n1, float n2)
{
    return n1 * n2;
}

float CalculadoraDivisao (float n1, float n2)
{
    return n1 / n2;
}

float CalculadoraPower (float n1, float n2)
{
    return pow(n1, n2);
}