#include <stdio.h>

/*  Autor: Victor Yukio Shirasuna RA: 245155
 *---------------------------------------------
 *  "Correção de Provas de Múltipla Escolha"
 *---------------------------------------------
 *
 * Entradas: deve-se informar o número de questões corrigidas,
 * logo em seguida, cada questão com o valor médio da escala cinza
 * 
 * Saídas: depois de serem informadas as questões, a letra correspondente será imprimida  
 */

int main ()
{
    int q_num;
    int a_line[5];

    int i_controller = 0;
    int index = 0;
    int b = 0;

    while (1)
    {
        // Armazenar o valor do número de questões
        scanf("%d", &q_num);

        // Se o número de questões for maior do que 20, registrar de que excedeu
        if (q_num > 20)
        {
            printf("Numero de questoes fora dos limites permitidos!\n");
            break;
        }
        // Quando o número de questões for 0, encerra-se o programa
        else if (q_num == 0)
            break;
        
        // Analisar cada linha das questões fornecidas
        for (int k = 0; k < q_num; k++)
        {
            // Analisar cada número de cada linha fornecida
            for (int i = 0; i < 5; i++)
            {
                // Armazenar os 5 valores da média pintada do retângulo
                scanf("%d", &a_line[i]);

                // Se for detectado que o valor for menor ou igual a 127, registrar os números validados
                if (a_line[i] <= 127)
                {
                    i_controller++;
                    index = i;
                }
                else
                    b++;
            }

            // Se houver mais de uma resposta marcada por linha ou for sinalizado que nenhuma foi marcada, caracterizá-la em *
            if (i_controller > 1 || b == 5)
            {
                printf("%c\n", '*');
            }
            else
            {
                switch (index)
                {
                case 0:
                    printf("%c\n", 'A');
                    break;
                case 1:
                    printf("%c\n", 'B');
                    break;
                case 2:
                    printf("%c\n", 'C');
                    break;
                case 3:
                    printf("%c\n", 'D');
                    break;
                case 4:
                    printf("%c\n", 'E');
                    break;
                }
            }

            i_controller = 0;
            b = 0;
        }
    }

    printf("\n");

    return 0;
}