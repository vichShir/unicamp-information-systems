#include <stdio.h>
#include <stdlib.h>

// Procedimento para coletar o nome sem problemas
void input(char *string, int length);

int main()
{
    // Estrutura que determina as variáveis do aluno
    struct aluno
    {
        char nome[101];
        int ra;
        float p1;
        float p2;
    };

    // Vetor para armazenar as medias de cada aluno
    float *medias;

    struct aluno *alunos;

    int n;

    // Coletar o número de alunos
    scanf("%d\n", &n);

    // Alocar dinamicamente a estrutra de alunos com o tamanho informado
    alunos = (struct aluno *) malloc(n * sizeof(struct aluno));

    medias = (float *) malloc(n * sizeof(float));

    // Se houver algum erro com a alocação dinâmica, reportar o erro e interromper o programa
    if (alunos == NULL)
    {
        printf("Memoria Insuficiente\n");
        return 1;
    }

    // Estrutra de repetição para coletar os dados da estrutura do aluno
    for (int i = 0; i < n; i++)
    {
        input(alunos[i].nome, 101);

        scanf("%d\n", &alunos[i].ra);
        scanf("%f\n", &alunos[i].p1);
        scanf("%f\n", &alunos[i].p2);
    }

    // Imprimir a estrutra do aluno
    for (int i = 0; i < n; i++)
    {
        medias[i] = (alunos[i].p1 + alunos[i].p2) / 2;
        printf("%d\t", alunos[i].ra);
        printf("%s\t", alunos[i].nome);
        printf("%.2f\n", medias[i]);
    }

    return 0;
}

void input(char *string, int length)
{
    fgets(string, length, stdin);

    for (int x = 0; x <= length; x++)
    {
        if (string[x] == '\n')
        {
            string[x] = '\0';
            break;
        }
    }
}