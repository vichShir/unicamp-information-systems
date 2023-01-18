#include <stdio.h>
#include <math.h>

int main ()
{
    typedef struct Ponto
    {
        float x;
        float y;
    } Point;

    Point p1;
    scanf("%f %f", &p1.x, &p1.y);

    Point p2;
    scanf("%f %f", &p2.x, &p2.y);

    float euc_dist;
    euc_dist = sqrt(((p1.x - p2.x)*(p1.x - p2.x)) + ((p1.y - p2.y)*(p1.y - p2.y)));

    if (euc_dist <= 0.0000001)
    {
        printf("os pontos sao iguais\n");
    }
    else
    {
        printf("os pontos nao sao iguais\n");
    }

    return 0;
}