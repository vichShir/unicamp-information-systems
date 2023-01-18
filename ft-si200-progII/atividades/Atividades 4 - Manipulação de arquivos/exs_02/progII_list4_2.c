#include <stdio.h>


int main(){
		
	FILE *file;
	
	file= fopen("dados.txt", "r");
	
	if(file== NULL){
		printf("Arquivo nao encontrado");
		system("pause");
		return 0;
	}
	
  unsigned	char x [100];
	unsigned int y[100];
	char w [100];
	
	fscanf(file, "%s %i %s", &x, &y, &w);
	
	printf("%s\n %i\n %s\n", x, y, w);
		
	
	return 0;
}
