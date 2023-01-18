/*==================================================================*/
/*               Programa Exercício 4 - Matricula de Alunos         */
/* -> Jônatas Goes da Silva - FT Unicamp                            */
/* -> Felipe Eduardo - FT Unicamp                                   */
/* -> Victor Yukio Shirasuna - FT Unicamp                           */
/*==================================================================*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
	
	int lin, i, j;
	float sexo, n_curso, n_matricula, maior_media = 0.00, **estudante, **estudantes_proc;
	
	printf("Quantidade de Alunos a serem Matriculados: ");
	scanf("%d", &lin); 
	
	if(lin > 100)
		return 1;
	
	//Alocação dinâmica das Matrizes estudante e estudantes procurados
		
		estudante = (float**) malloc(lin * sizeof(float*));                 					
		estudantes_proc = (float**) malloc(lin * sizeof(float*));                          

	for( i = 0; i < 4; i++)
	{
		estudante[i] = (float*) malloc( 4 * sizeof(float));
		estudantes_proc[i] = (float*) malloc( 4 * sizeof(float));
	}
	
	//Coletando dados dos Alunos (devem ser inseridos na ordem pedida)
	
	for( i = 0; i < lin; i++)
	{
		printf("Digite os dados do Aluno[%d]:\n", i + 1);
		for ( j = 0; j < 4; j++)
		{
			scanf("%f", &estudante[i][j]);
		}
	}
	
	//Dados do estudante que sera procurado
	
	printf("\nDigite o Sexo a ser pesquisado: ");
	scanf("%f", &sexo);
	printf("\nDigite o Curso a ser pesquisado: ");
	scanf("%f", &n_curso);
	
	//Verificando a matricula do estudante com os requisitos pedidos
	
	for( i = 0; i < lin; i++)
	{
		if((sexo == estudante[i][1]) && (n_curso == estudante[i][2]))
		{
			if(i == 0)
			{
				maior_media = estudante[i][3];											//inicializando maior_media com media de um estudante
			}
			
			if(estudante[i][3] >= maior_media)											//como não foi descrito um "desempate", o ultimo aluno com a maior media tera o num. de matricula apresentado
			{
				maior_media = estudante[i][3];											//maior media atual
				n_matricula = estudante[i][0];											//num. de matricula do aluno com a maior media atual
			}
		}
	}
	
	printf("\nNumero de matricula do aluno: %.0f\n", n_matricula);
	return 0;
}
