#include <stdio.h>

#define CHAR_MAX 50
#define EST_MAX 30

/*  ALGORITMOS E PROGRAMACAO DE COMPUTADORES II
 *  4 Lista de Exercicios - Exercicio n.4
 * 
 *  Autores:
 *  Felipe Eduardo dos Santos Freire
 *  Jonatas Goes da Silva
 *  Victor Yukio Shirasuna
 */

typedef struct paciente
{
    char nome[CHAR_MAX];
    int telefone;
    char tipoSanguineo[CHAR_MAX];
} paciente;

int main()
{
    FILE *ficha;
    paciente p[EST_MAX];
    int n_pacientes = 0;

    // Abrir o arquivo para leitura binaria
    ficha = fopen("dadosbin.dat", "rb");
    if(ficha != NULL)
    {
        // Ler os dados no arquivo
        fread(&n_pacientes, sizeof(int), 1, ficha);
        fread(p, sizeof(paciente), n_pacientes, ficha);
        fclose(ficha);

        // Exibir os dados contidos no arquivo
        printf("\tPacientes Cadastrados:\n");
        printf("Numero de pacientes: %d\n", n_pacientes);
        for(int i = 0; i < n_pacientes; i++)
            printf("\nNome: %s\nTelefone: %d\nTipo Sanguineo: %s\n", p[i].nome, p[i].telefone, p[i].tipoSanguineo);
    }
    else
        printf("Erro na abertura do arquivo.\n");

    return 0;
}
