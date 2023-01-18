/*==================================================================*/
/*        Programa Exerc�cio 5 - Informatiza��o Biblioteca          */
/* -> J�natas Goes da Silva - FT Unicamp                            */
/* -> Felipe Eduardo - FT Unicamp                                   */
/* -> Victor Yukio Shirasuna - FT Unicamp                           */
/*==================================================================*/

/*==================================================================================*/
/*                         Documenta��o Espec�fica                                  */
/* C�digo func � 'r': A fun��o "RegisterData" atua como op��o de registro de dados  */
/* C�digo func � 'a': A fun��o "RegisterData" atua como op��o de altera��o de dados */
/* C�digo func � 'd': A fun��o "RegisterData" atua como op��o de exclus�o de dados  */
/*==================================================================================*/

#include<stdio.h>
#include<string.h>

// Definir o tamanho m�ximo dos textos inseridos
#define TEXT_LENGTH 101
// Definir a quantidade m�xima de cada cole��o
#define COLLECTION_SIZE 50

// Fun��es prim�rias e secund�rias
void HeaderScreen();
void RegisterBook();
void QueryBook();
void AlterBook();
void DeleteBook();
void Input(char *string, int length);

// Estrutura das obras informatizadas
typedef struct Book
{
	int idCode;
	char title[TEXT_LENGTH];
	char authorName[TEXT_LENGTH];
	char publisher[TEXT_LENGTH];
	int totalPages;
		
} Book;

// Vetores comportando as cole��es EXATAS, HUMANAS E BIOM�DICAS
Book exactCollection[COLLECTION_SIZE];
Book humanCollection[COLLECTION_SIZE];
Book bioMeCollection[COLLECTION_SIZE];

// Fun��es secund�rias de execu��o
void RegisterData(Book b[], char func);
void QuerySearch(Book b[]);

#pragma region MAIN_FUNCTION
int main()
{		
	// Determinar inicialmente as posi��es como vazias
	for(int i = 0; i < COLLECTION_SIZE; i++)
	{
		exactCollection[i].idCode = 0;
		humanCollection[i].idCode = 0;
		bioMeCollection[i].idCode = 0;
	}

	// Enumeration do sistema
	enum sysOptions { None, Register, Query, Alteration, Delete, Leave };
	enum sysOptions useOption = None;
	
	// Enquanto o usu�rio n�o selecionar a op��o "Leave"
	while(useOption != Leave)
	{
		int _taskUserId;
		
		// Mostrar o Menu Inicial
		HeaderScreen();
		printf("-> ");
		scanf("%d", &_taskUserId);
		
		// Atribuir a op��o escolhida
		if(_taskUserId == 1)		useOption = Register;
		else if(_taskUserId == 2) 	useOption = Query;
		else if(_taskUserId == 3) 	useOption = Alteration;
		else if(_taskUserId == 4) 	useOption = Delete;
		else if(_taskUserId == 5) 	useOption = Leave;
		else 						useOption = None;
		
		// Executar a fun��o
		switch(useOption)
		{
			case Register:
				RegisterBook();
				break;
			case Query:
				QueryBook();
				break;
			case Alteration:
				AlterBook();
				break;
			case Delete:
				DeleteBook();
				break;
			case Leave:
				printf("Sessao encerrada.\n");
				break;
		}
	}
	
	return 0;
}
#pragma endregion

#pragma region PRIMARY_FUNCTIONS
void HeaderScreen()
{
	printf("\n1. Cadastrar obras\n");
	printf("2. Consulta as informacoes de uma obra\n");
	printf("3. Alteracoes das informacoes de uma obra\n");
	printf("4. Excluir uma obra\n");
	printf("5. Sair\n");
}

void RegisterBook()
{
	printf("\n|==============|\n");
	printf("|Cadastrar Obra|\n");
	printf("|==============|\n");
	printf("A que colecao o livro pertence?\n");
	printf("\t1. Colecao de Exatas\n");
	printf("\t2. Colecao de Humanas\n");
	printf("\t3. Colecao de Biomedicas\n");
	
	int _choosenClt;
	printf("-> ");
	scanf("%d", &_choosenClt);

	switch(_choosenClt)
	{
		case 1:
			RegisterData(exactCollection, 'r');
			break;
		case 2:
			RegisterData(humanCollection, 'r');
			break;
		case 3:
			RegisterData(bioMeCollection, 'r');
			break;
	}
}

void QueryBook()
{
	printf("\n|================|\n");
	printf("|Consulta de Obra|\n");
	printf("|================|\n");
	printf("A que colecao o livro pertence?\n");
	printf("\t1. Colecao de Exatas\n");
	printf("\t2. Colecao de Humanas\n");
	printf("\t3. Colecao de Biomedicas\n");
	
	int _choosenClt;
	printf("-> ");
	scanf("%d", &_choosenClt);
	
	switch(_choosenClt)
	{
		case 1:
			QuerySearch(exactCollection);
			break;
		case 2:
			QuerySearch(humanCollection);
			break;
		case 3:
			QuerySearch(bioMeCollection);
			break;
	}
}

void AlterBook()
{
	printf("\n|===========================|\n");
	printf("|Alterar Informacoes de Obra|\n");
	printf("|===========================|\n");
	printf("A que colecao o livro pertence?\n");
	printf("\t1. Colecao de Exatas\n");
	printf("\t2. Colecao de Humanas\n");
	printf("\t3. Colecao de Biomedicas\n");
	
	int _choosenClt;
	printf("-> ");
	scanf("%d", &_choosenClt);
	
	switch(_choosenClt)
	{
		case 1:
			RegisterData(exactCollection, 'a');
			break;
		case 2:
			RegisterData(humanCollection, 'a');
			break;
		case 3:
			RegisterData(bioMeCollection, 'a');
			break;
	}
}

void DeleteBook()
{
	printf("\n|============|\n");
	printf("|Excluir Obra|\n");
	printf("|============|\n");
	printf("A que colecao o livro pertence?\n");
	printf("\t1. Colecao de Exatas\n");
	printf("\t2. Colecao de Humanas\n");
	printf("\t3. Colecao de Biomedicas\n");
	
	int _choosenClt;
	printf("-> ");
	scanf("%d", &_choosenClt);
	
	switch(_choosenClt)
	{
		case 1:
			RegisterData(exactCollection, 'd');
			break;
		case 2:
			RegisterData(humanCollection, 'd');
			break;
		case 3:
			RegisterData(bioMeCollection, 'd');
			break;
	}
}
#pragma endregion

#pragma region SECONDARY_FUNCTIONS
void RegisterData(Book b[], char func) 
{
	int _userCode, _pages;
	char _title[TEXT_LENGTH], _author[TEXT_LENGTH], _publisher[TEXT_LENGTH];
	
	printf("Codigo de Catalogacao: ");
	scanf("%d", &_userCode);
	
	// Loop de sonda
	for(int i = 0; i < COLLECTION_SIZE; i++)
	{
		if(b[i].idCode == _userCode)
		{
			if(func == 'r')
			{
				printf("Obra ja cadastrada!\n");
				return;
			}
			else if(func == 'a')
			{
				printf("Insira as novas informacoes:\n");
				break;
			}
			else if(func == 'd')
			{
				b[i].idCode = 0;
				printf("Obra excluida!\n");
				return;
			}
		}
		else if(i == COLLECTION_SIZE - 1)
		{
			if(func == 'a' || func == 'd')
			{
				printf("OBRA INEXISTENTE\n");
				return;
			}
		}
	}
	
	// Loop de manipula��o dos dados
	for(int i = 0; i < COLLECTION_SIZE; i++)
	{
		if((b[i].idCode == 0 && func == 'r') || (b[i].idCode == _userCode && func == 'a'))
		{
			printf("Nome da Obra: ");
			Input(_title, TEXT_LENGTH);
			Input(_title, TEXT_LENGTH);
			
			printf("Nome do Autor: ");
			Input(_author, TEXT_LENGTH);
			
			printf("Editora: ");
			Input(_publisher, TEXT_LENGTH);
			
			printf("N de Paginas: ");
			scanf("%d", &_pages);
			
			b[i].idCode = _userCode;
			strcpy(b[i].title, _title);
			strcpy(b[i].authorName, _author);
			strcpy(b[i].publisher, _publisher);
			b[i].totalPages = _pages;
			
			if(func == 'r')
				printf("Obra registrada com sucesso!\n");
			else if(func == 'a')
				printf("Alteracoes salvas com sucesso!\n");
			break;
		}
	}
}

void QuerySearch(Book b[])
{
	int _userCode;
	printf("Codigo de Catalogacao: ");
	scanf("%d", &_userCode);
	
	for(int i = 0; i < COLLECTION_SIZE; i++)
	{
		if (b[i].idCode == _userCode)
		{
			printf("Nome da Obra: %s\n", b[i].title);
			printf("Nome do Autor: %s\n", b[i].authorName);
			printf("Editora: %s\n", b[i].publisher);
			printf("N de Paginas: %d\n", b[i].totalPages);
			
			break;
		}
		else if (i == COLLECTION_SIZE - 1)
		{
			printf("OBRA INEXISTENTE\n");
			break;
		}
	}
}

// Fun��o para coletar o input (vetor de char)
void Input(char *string, int length)
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
#pragma endregion
