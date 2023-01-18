#include<stdio.h>
#include<math.h>

float media (float n1, float n2, char type);

int main ()
{
    char type;
    float n1, n2;
    scanf("%c", &type);
    scanf("%f %f", &n1, &n2);

    printf("%.3f\n", media(n1, n2, type));

    return 0;
}

float media (float n1, float n2, char type)
{
    // Media Aritmetica
    if (type == 'A')
    {
        return (n1 + n2)/2;
    }
    // Media Geometrica
    else if (type == 'B')
    {
        return sqrt(n1 * n2);
    }
}