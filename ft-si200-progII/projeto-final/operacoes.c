#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "headers/operacoes.h"

void waitUser()
{
    // Funcao nao sai do loop enquanto o usuario nao digitar a tecla enter
    printf("\nPressione [Enter] para continuar.");
    while(getchar()!='\n');
    getchar();
}

char* getTextInput()
{
    char *textField = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
    fflush(stdin);
    fgets(textField, MAX_CHAR_SIZE, stdin);
    textField[strcspn(textField, "\n")] = 0;
    return textField;
    free(textField);
}