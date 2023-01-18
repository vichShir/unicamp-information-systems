#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/*==================================================================*/
/*                 Programa de Folha de Pagamento                   */
/* Desenvolvido por Victor Yukio Shirasuna, RA: 245155 - FT Unicamp */
/*==================================================================*/

void GetName(char *string, int length);

int main ()
{
    /*============*/
    /* Estruturas */
    /*============*/

    // Estrutura para armazenar vetores de nomes
    typedef struct StringNames
    {
        char nome[101];
    } StringNames;

    // Estrutra do funcionario
    typedef struct Employer
    {
        char name[101];         // Nome do Funcionario
        float base_salary;      // Salario Base
        float commission;       // Comissao
        float sum_salary;       // Total do salario recebido
    } Employer;

    // Estrutura para segregar os funcionarios pelas categorias de salario
    typedef struct category
    {
        StringNames nomes[100];
    } Category;

    /*===================================*/
    /* Coleta dos dados dos Funcionarios */
    /*===================================*/

    Employer employees[100];    // Criacao dos funcionarios
    int i = 0;                  // Variavel para controle do numero total de funcionarios

    // Coletar os dados dos funcionarios, ate que a palavra FIM seja enviada
    while(strcmp("FIM", employees[i].name) != 0)
    {
        // Funcao para coletar o nome do funcionario sem o \n do fgets()
        GetName (employees[i].name, 101);

        // Caso seja enviado FIM, encerrar o laco do while sem armazena-lo como dado
        if (strcmp("FIM", employees[i].name) == 0)
            break;

        // Coletar os dados com relacao ao salario
        scanf("%f %f\n", &employees[i].base_salary, &employees[i].commission);
        employees[i].sum_salary = employees[i].base_salary + employees[i].commission;
        i++;
    }

    /*=========================================================*/
    /* Organizar os funcionarios em ordem crescente de salario */
    /*=========================================================*/

    float temp_salary;      // Variavel temporaria dos salarios
    char temp_name[101];    // Variavel temporaria dos nomes

    // j -> varia do Total de Funcionarios - 1 ate 1
    // k -> varia de 0 ate o Total de Funcionarios - 1
    for (int j = (i - 1); j > 0; j--)
    {
        for (int k = 0; k < j; k++)
        {
            // Para realizar as trocas, é preciso que k não seja o último index dos Funcionarios.
            // E também o salário do funcionário analisado ser maior que o funcionário seguinte.
            if (k < (i - 1) && employees[k].sum_salary > employees[k+1].sum_salary)
            {
                // Realizar a troca dos salarios
                temp_salary = employees[k+1].sum_salary;
                employees[k+1].sum_salary = employees[k].sum_salary;
                employees[k].sum_salary = temp_salary;

                // Realizar tambem a troca dos nomes
                strcpy(temp_name, employees[k+1].name);
                strcpy(employees[k+1].name, employees[k].name);
                strcpy(employees[k].name, temp_name);
            }
        }
    }

    /*================================*/
    /* Criar as Categorias de Salario */
    /*================================*/

    float salary_categories[100];   // Variavel com os valores das categorias de salario
    int total_sy_cat = 0;           // Variavel do total de categorias criadas de salario

    // j -> varia de 0 ate o Total de Funcionarios
    for (int j = 0; j < i; j++)
    {
        // Caso o salario analisado seja diferente do funcionario seguinte
        if (employees[j].sum_salary != employees[j+1].sum_salary)
        {
            // Criar uma categoria do salario analisado
            salary_categories[total_sy_cat] = employees[j].sum_salary;
            total_sy_cat++;
        }
    }

    /*=============================================*/
    /* Contagem do numero de pessoas por categoria */
    /*=============================================*/

    int* cat_count;     // Vetor da contagem de funcionarios por categoria

    // Alocar dinamicamente o vetor do total da contagem de cada categoria
    cat_count = (int*) malloc(total_sy_cat*sizeof(int));

    // j -> varia de 0 ate o Total de Funcionarios
    // k -> varia de 0 ate o Total de Categorias
    for (int j = 0; j < i; j++)
    {
        for (int k = 0; k < total_sy_cat; k++)
        {
            if (employees[j].sum_salary == salary_categories[k])
            {
                // Contagem do numero de Funcionarios por categoria
                cat_count[k] += 1;
            }
        }
    }

    /*================================================================*/
    /* Transferir os dados do Funcionario para estrutura categorizada */
    /*================================================================*/

    Category* categories;   // Criar as categorias
    int aux_name = 0;       // Variavel auxiliar para contagem (index) do vetor de nomes
    int j_current = 0;      // Armazenar o valor de j

    // Alocar dinamicamente o vetor das categorias com o total determinado
    categories = (Category*) malloc(total_sy_cat*sizeof(Category));

    // j -> varia de 0 ate o Total de Categorias
    // k -> varia de 0 ate o Total de Funcinarios
    for (int j = 0; j < total_sy_cat; j++)
    {
        for (int k = 0; k < i; k++)
        {
            if (j != j_current)
                aux_name = 0;

            // Caso o salario do Funcionario seje igual ao valor da Categoria em questao
            if (employees[k].sum_salary == salary_categories[j])
            {
                // Copiar seu nome para a estrutra categorizada
                strcpy(categories[j].nomes[aux_name].nome, employees[k].name);

                j_current = j;
                aux_name++;
            }   
        }
    }

    /*=================================================================================*/
    /* Organizar o nome dos funcionarios da estrutura categorizada em ordem alfabetica */
    /*=================================================================================*/

    // l -> varia de 0 ate o Total de Categorias
    // j -> varia do Numero de Contagens da Categoria analisada - 1 ate 1
    // k -> varia de 0 ate o Numero de Contagens da Categoria
    for (int l = 0; l < total_sy_cat; l++)
    {
        for (int j = (cat_count[l] - 1); j > 0; j--)
        {
            for (int k = 0; k < j; k++)
            {
                if (strcmp(categories[l].nomes[k].nome, categories[l].nomes[k+1].nome) > 0)
                {
                    strcpy(temp_name, categories[l].nomes[k+1].nome);
                    strcpy(categories[l].nomes[k+1].nome, categories[l].nomes[k].nome);
                    strcpy(categories[l].nomes[k].nome, temp_name);
                }
            }
        }
    }

    /*==================================================*/
    /* Imprimir os nomes dos funcionarios por categoria */
    /*==================================================*/

    // j -> varia de 0 ate o Total de Categorias
    // k -> varia de 0 ate o Numero Total de Contagens da Categoria analisada
    printf("Folha de Pagamento\n\n");
    for (int j = 0; j < total_sy_cat; j++)
    {
        printf("Salario no Mes: R$ %.2f\n", salary_categories[j]);

        for (int k = 0; k < cat_count[j]; k++)
        {
            printf("- %s\n", categories[j].nomes[k].nome);
        }

        printf("\n");
    }

    return 0;
}

void GetName(char *string, int length)
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