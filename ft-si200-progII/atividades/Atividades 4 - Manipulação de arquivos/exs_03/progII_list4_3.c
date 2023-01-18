#include <stdio.h>

typedef struct paciente
{
    char nome[50];
    int numero;
    char sangue[50];
} paciente;

//int grava_arquivo(){
int main(void){

	paciente p[50];
    int i, n_pacientes = 0;
    FILE *fp;

	printf("indique o numero de pacientes\n");
	scanf("%d",&n_pacientes);

	if(n_pacientes <= 50){
		for(i = 0; i < n_pacientes; i++){
			printf("Escreva o nome do paciente:");
			scanf("%s",p[i].nome);
				
			printf("Escreva o numero do paciente:");
			scanf("%d",&p[i].numero);
				
			printf("Escreva o tipo sanguineo  do paciente:");
			scanf("%s",p[i].sangue);
		}
	}

    fp = fopen("dadosbin.dat", "wb");
    if (fp == NULL) {
		printf("arquivo nao encontrado");
	} else {
    	fwrite(&n_pacientes, sizeof(int), 1, fp);
        fwrite(p, sizeof(paciente), n_pacientes, fp);
        fclose(fp);

        printf("Pacientes cadastrados com sucesso!\n");
	}

	return 0;
}


