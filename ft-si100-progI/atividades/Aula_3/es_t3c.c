#include <stdio.h>

int main()
{
    float x, y;
    char op;
    scanf ("%f %c %f", &x, &op, &y);

    if (op == '+')
        printf ("%.3f%c%.3f=%0.3f\n", x, op, y, (x + y));
    else if (op == '-')
        printf ("%.3f%c%.3f=%0.3f\n", x, op, y, (x - y));
    else if (op == '*')
        printf ("%.3f%c%.3f=%0.3f\n", x, op, y, (x * y));
    else if (op == '/')
        printf ("%.3f%c%.3f=%0.3f\n", x, op, y, (x / y));
    else
        printf ("Operador  invalido\n");

    return 0;
}