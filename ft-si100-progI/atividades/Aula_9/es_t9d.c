#include<stdio.h>

void PowerCube (int A[], int B[]);

int main ()
{
    int A[10];
    int B[10];

    for (int i = 0; i < 10; i++)
    {
        scanf("%d", &A[i]);
    }

    PowerCube(A, B);

    for (int i = 0; i < 10; i++)
    {
        printf("%d\n", B[i]);
    }

    return 0;
}

void PowerCube (int A[], int B[])
{
    for (int i = 0; i < 10; i++)
    {
        B[i] = (A[i] * A[i] * A[i]);
    }
}