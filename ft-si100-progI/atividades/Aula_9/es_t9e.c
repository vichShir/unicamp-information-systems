#include<stdio.h>

void Sum (int a, int b, int c, int d);
void Multiplication (int a, int b, int c, int d);

// Estrutura para um Número Complexo
typedef struct NumeroComplexo
{
    int real;
    int imag;
} NumeroComplexo;

int main ()
{
    // Variáveis de Entrada
    NumeroComplexo z;
    NumeroComplexo w;
    char op[4];

    // Coletar os valores do número complexo z
    scanf("%d", &z.real);
    scanf("%d", &z.imag);

    // Coletar o operador (adição ou multiplicação)
    fgets(op, 4, stdin);

    // Coletar os valores do número complexo w
    scanf("%d", &w.real);
    scanf("%d", &w.imag);

    // Filtrar o tipo de operador para seu respectivo procedimento
    switch (op[1])
    {
    case '+':
        Sum(z.real, z.imag, w.real, w.imag);
        break;
    
    case '*':
        Multiplication(z.real, z.imag, w.real, w.imag);
        break;
    }

    return 0;
}

void Sum (int a, int b, int c, int d)
{
    // Número Complexo resultante
    NumeroComplexo x;

    x.real = a + c;
    x.imag = b + d;

    printf("%d + %di\n", x.real, x.imag);
}

void Multiplication (int a, int b, int c, int d)
{
    // Número Complexo resultante
    NumeroComplexo x;

    x.real = (a*c) - (b*d);
    x.imag = (a*d) + (b*c);

    printf("%d + %di\n", x.real, x.imag);
}