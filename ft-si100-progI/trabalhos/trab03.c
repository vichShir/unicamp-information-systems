#include <stdio.h>
/* Programa para imprimir o calendário a partir da coleta do ano informado
 * Nome: Victor Yukio Shirasuna, RA: 245155
 */

void PrintfMonth (int *current_month, int *first_day_month, int max_days)
{
    /* Corrigir o número do dia somente para o meses depois de janeiro */
    if (*current_month != 1)
        *first_day_month -= 1;

    printf("|-----------------------------|\n");

    /* Determinar o header do mês */
    switch (*current_month)
    {
    case 1:
        printf("|Janeiro                      |\n");
        break;
    case 2:
        printf("|Fevereiro                    |\n");
        break;
    case 3:
        printf("|Março                        |\n");
        break;
    case 4:
        printf("|Abril                        |\n");
        break;
    case 5:
        printf("|Maio                         |\n");
        break;
    case 6:
        printf("|Junho                        |\n");
        break;
    case 7:
        printf("|Julho                        |\n");
        break;
    case 8:
        printf("|Agosto                       |\n");
        break;
    case 9:
        printf("|Setembro                     |\n");
        break;
    case 10:
        printf("|Outubro                      |\n");
        break;
    case 11:
        printf("|Novembro                     |\n");
        break;
    case 12:
        printf("|Dezembro                     |\n");
        break;
    }
    *current_month += 1;
    
    printf("|-----------------------------|\n");
    printf("| dom seg ter qua qui sex sab |\n");

    /* Variáveis para controle da impressão do mês */
    int aux = 0, j_final = 0, print_date = 0, date_count = 0;

    /* Caminhar pelas 6 linhas de dias do mês */
    for (int i = 0; i < 6; i++)
    {
        /* Caminhar pelos 7 dias de cada semana */
        for (int j = 0; j < 7; j++)
        {
            /* Encerrar cada linha da semana com uma | e pulo de linha */
            if (i != aux)
                printf("|\n");

            /* Percorrer pelos 6 índices das linhas de dias do mês */
            for (int l = 0; l < 6; l++)
            {
                /* Imprimir o começo de cada linha */
                if (i == l && j == 0)
                {
                    printf("| ");
                }

                /* Percorrer pelos 7 índices de cada dia da semana */
                for (int k = 0; k < 7; k++)
                {
                    if (i == l && j == k)
                    {
                        /* Ajuste quando 1 de janeiro cair no domingo */
                        if (*first_day_month == 0) *first_day_month = 7;

                        /* Determinar os dias do mês de acordo com os índices */
                        print_date = (k + (*first_day_month + 7*(l - 1))) + 1;

                        /* Corrigir as datas inferiores a 1 de janeiro */
                        if (i == 0 && print_date <= 0)
                        {
                            printf(" %2s ", "--");
                            break;
                        }

                        /* Chegando na última semana do mês, imprimir o restante se for o caso */
                        if (i == 5 && date_count < max_days)
                        {
                            printf(" %02d ", print_date);
                            date_count++;
                        }
                        /* Permeando até o índice 4 de i, e se a data impressa for menor que 31 */
                        else if (i != 5 && date_count < max_days)
                        {
                            printf(" %02d ", print_date);
                            date_count++;
                        }
                        /* Caso contrário, imprimir os dias nulos */
                        else if (date_count >= max_days)
                        {
                            printf(" %2s ", "--");
                        }

                        /* Ao chegar ao último índice de i e de k, fechar com | */
                        if (i == 5 && k == 6)
                        {
                            printf("|\n");
                        }

                        /* Registrar o último dia do mês */
                        if (date_count == max_days && j_final == 0)
                        {
                            j_final = 1;
                            switch (j)
                            {
                            case 0:
                                /* Domingo */
                                *first_day_month = 0;
                                break;
                            case 1:
                                /* Segunda */
                                *first_day_month = 6;
                                break;
                            case 2:
                                /* Terça */
                                *first_day_month = 5;
                                break;
                            case 3:
                                /* Quarta */
                                *first_day_month = 4;
                                break;
                            case 4:
                                /* Quinta */
                                *first_day_month = 3;
                                break;
                            case 5:
                                /* Sexta */
                                *first_day_month = 2;
                                break;
                            case 6:
                                /* Sábado */
                                *first_day_month = 1;
                                break;
                            }
                        }
                    }
                }
            }
            aux = i;
        }
    }
    j_final = 0;
}

int main () 
{
    int y, g, c, x, z, e, n, d, date;
    int abril = 0, bissexto = 0;
    int first_january_day;
    int current_month = 1;
    int first_day_month;

    /* Coletar o ano desejado */
    scanf("%d", &y);

    /* Cálculos dos fatores do algoritmo da data da Páscoa */
    g = (y % 19) + 1;
    c = (y / 100) + 1;
    x = ((3*c)/4) - 12;
    z = ((8*c + 5)/25) - 5;
    e = (11*g + 20 + z - x) % 30;

    /* Ajuste da Epacta (e) */
    if ((e == 25 && g > 11) || e == 24) e++;

    /* Ajuste de Lua Cheia (n) */
    n = 44 - e;
    if (n < 21)
        n += 30;

    /* Cálculo de Domingo de Páscoa */
    d = ((5*y)/4) - (x + 10);
    /* Determinação da data da Páscoa */
    date = (n + 7) - ((d+n) % 7);
    if (date > 31)
    {
        date -= 31;
        abril = 1;
    }
    else
    {
        abril = 0;
    }

    int ajust_y;
    /* Ajuste para determinação se o ano é bissexto */
    if (y % 100 == 0)
    {
        y = y / 100;
        ajust_y = 1;
    }
    /* Determinar se o ano é bissexto */
    if (y % 4 == 0)
    {
        bissexto = 1;
    }
    else
    {
        bissexto = 0;
    }

    /* Determinar em que dia cai 1 de janeiro */
    if (bissexto == 1)
    {
        if (abril == 1)
        {
            first_january_day = (31 + 29 + 31 + (date - 1)) % 7;
        }
        else
        {
            first_january_day = (31 + 29 + (date - 1)) % 7;
        }
    }
    else
    {
        if (abril == 1)
        {
            first_january_day = (31 + 28 + 31 + (date - 1)) % 7;
        }
        else
        {
            first_january_day = (31 + 28 + (date - 1)) % 7;
        }
    }

    /* Array contendo o máximo de dias em que cada mês possui */
    int days_in_months[13] = {31, 28, 29,  31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    /* Se houve o ajuste de y anteriormente, redefini-lo para imprimir */
    if (ajust_y == 1)
    {
        ajust_y = 0;
        y = y * 100;
    }

    printf("Calendario do ano %d\n", y);
    
    /* Percorrer o Array dos dias máximos para informar para a função de imprimir os meses */
    for (int i = 0; i < 13; i++)
    {
        /* Se chegar no índice de fevereiro e o ano não for bissexto */
        if (i == 1 && bissexto == 0)
        {
            PrintfMonth(&current_month, &first_day_month, days_in_months[i]);
        }
        /* Senão se o ano não for bissexto */
        else if (i == 1 && bissexto == 1)
        {
            PrintfMonth(&current_month, &first_day_month, days_in_months[i+1]);
        }
        /* Senão se o índice for maior que 2 (acima dos de fevereiro) ou no índice de janeiro */
        else if (i > 2 || i == 0)
        {
            /* Caso for de janeiro */
            if (i == 0)
            {
                PrintfMonth(&current_month, &first_january_day, days_in_months[i]);
                /* Atualizar o valor do último dia de janeiro */
                first_day_month = first_january_day;
            }
            else 
                PrintfMonth(&current_month, &first_day_month, days_in_months[i]);
        }
    }
    printf("|-----------------------------|\n");
    
    return 0;
}