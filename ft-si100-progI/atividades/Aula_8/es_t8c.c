#include<stdio.h>

int main ()
{
    struct corpo
    {
        float altura;
        float peso;
        char nome[60];
    } corpo_1;

    scanf("%f", &corpo_1.altura);
    scanf("%f", &corpo_1.peso);
    scanf("%s", corpo_1.nome);
    
    float imc;

    imc = corpo_1.peso / (corpo_1.altura * corpo_1.altura);

    printf("%.3f\n", imc);

    return 0;
}