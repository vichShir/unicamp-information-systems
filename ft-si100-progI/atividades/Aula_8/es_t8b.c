#include<stdio.h>

int main ()
{
    typedef struct Ponto
    {
        int x;
        int y;
    } Point;

    typedef struct Retangulo
    {
        Point p1;   // Ponto inferior esquerdo
        Point p2;   // Ponto superior direito
    } Rectangle;

    Rectangle recs[2];

    for (int i = 0; i < 2; i++)
    {
        scanf("%d %d", &recs[i].p1.x, &recs[i].p1.y);
        scanf("%d %d", &recs[i].p2.x, &recs[i].p2.y);
    }

    if (
        recs[1].p1.x >= recs[0].p1.x && recs[1].p1.y >= recs[0].p1.y && 
        recs[1].p2.x <= recs[0].p2.x && recs[1].p2.y <= recs[0].p2.y
        )
    {
        printf("o segundo retangulo esta contido no primeiro\n");
    }
    else
    {
        printf("o segundo retangulo nao esta contido no primeiro\n");
    }

    return 0;
}