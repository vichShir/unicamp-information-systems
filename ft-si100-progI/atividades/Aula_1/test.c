#include <stdio.h>

int main ()
{
    int ano, dias;
    printf ("Digite um número: ");
    scanf ("%d", &ano);
    dias = ano * 365;
    printf ("Sua idade em dias é: %d\n", dias);

    int test = 5;
    printf ("Valor é: %d\n", test == 5);

    return 0;
}