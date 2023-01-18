#include <stdio.h>
#include<math.h>

    float salario_min;
    float renda;
    int dependente;
    double cpf;
    float s1;
     float v2;
     float sla;

int main(){


  printf("          calculadora de imposto de renda\n");

    printf("Digite o salario minimo atual:\n");
    scanf("%f",&salario_min);

        printf("digite seu cpf\n");
        scanf("%lf",&cpf);

            printf("Digite o numero de dependentes:\n");
            scanf("%d",&dependente);

                printf("Digite sua renda mensal:\n");
                scanf("%f",&renda);

                //printf("%.2f %0.lf %d %.2f\n",salario_min,cpf,dependente,renda);

              v2=(renda* dependente*5/100);
             
              renda=(renda-v2);
               printf("%.2f\n",renda);

                  //condições para o calculo do imposto
            if(renda < 2 *salario_min) //menos de dois salarios 
            {
            printf("isento de impostos\n");
            }   
              else if(renda >= 2 * salario_min && renda <  3 * salario_min) //maior ou igual a 2 salarios e menor que 3 salarios
             {
                 
             s1=(renda * 5/100);
          
             printf( "paga imposto de %.2f\n",s1);
             }
             else if(3 * salario_min && renda <  5 * salario_min) //me
             {
                 s1=(renda*10/100); //paga 10%
         
                 printf( "paga imposto de %.2f\n",s1);
             }
             else if( renda >=  5 * salario_min && renda <  7 * salario_min)
             {
                  s1=(renda*15/100); 
                  printf( "paga imposto de %.2f\n",s1);
                  
             }
             else if (renda >=  7 * salario_min)
             {
                        s1=(renda*20/100); //paga 20%
                        printf( "paga imposto de %.2f\n",s1);
             }
    
return 0;
}
