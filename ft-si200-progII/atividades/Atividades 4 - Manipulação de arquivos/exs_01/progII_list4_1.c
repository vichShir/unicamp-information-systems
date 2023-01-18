#include <stdio.h>

int main()
{
    int resp, Telefone;
    char Nome[100], tipoSanguineo[5];
    FILE *usuarios;

    usuarios = fopen("usuarios.txt", "a+");

    if(usuarios != NULL)
    {
        do
        {
            fflush(stdin);
            printf("Insira o Nome do Usuario\n>> ");
            fgets(Nome, 100, stdin);
            fprintf(usuarios, "%s", Nome);

            fflush(stdin);

            printf("Insira o Tipo Sanguineo do Usuario\n>> ");
            fgets(tipoSanguineo, 5, stdin);
            fprintf(usuarios, "%s", tipoSanguineo);

            printf("Insira o telefone do Usuario\n>> ");
            scanf("%d", &Telefone);
            fprintf(usuarios, "%d\n", Telefone);

            printf("Deseja continuar?\n -Sim(1)\n -Nao(0)\n>> ");
            scanf("%d", &resp);

        }while(resp != 0);

        printf("\nROTINA ENCERRADA");
        fclose(usuarios);
    }
    else
        printf("Erro na criação do arquivo");
    
    return 0;
}