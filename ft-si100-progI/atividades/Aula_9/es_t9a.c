#include<stdio.h>
#include<math.h>

#define pi 3.14159

float volume_esfera (float raio)
{
    return (pow(raio, 3) * pi) * 4/3;
}

int main ()
{
    float raio;
    scanf("%f", &raio);
    printf("%.2f\n", volume_esfera(raio));

    return 0;
}