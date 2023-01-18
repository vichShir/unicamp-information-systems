#include <stdio.h>

int main ()
{
    int n, s, sub;
    long fact_n;
    long fact_s;
    long fact_sub;

    scanf("%d", &n);
    scanf("%d", &s);

    fact_n = 1;
    fact_s = 1;
    fact_sub = 1;

    sub = n - s;
    /* Cálculo do fatorial da diferença entre n e s */
    while (sub > 1)
    {
        fact_sub *= sub--;
    }

    /* Cálculo do fatorial de n */
    while (n > 1)
    {
        fact_n *= n--;
    }

    /* Cálculo do fatorial de s */
    while (s > 1)
    {
        fact_s *= s--;
    }

    printf("%ld\n", fact_n/(fact_s * fact_sub));

    return 0;
}