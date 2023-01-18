#include <stdio.h>

int main ()
{
    int input;
    scanf ("%d", &input);

    input%2 == 0 ? printf ("par\n") : printf ("impar\n");

    return 0;
}