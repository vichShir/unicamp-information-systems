/*==================================================================*/
/*               Programa Exercício 1 - Finanças                    */
/* -> Jônatas Goes da Silva - FT Unicamp                            */
/* -> Felipe Eduardo - FT Unicamp                                   */
/* -> Victor Yukio Shirasuna - FT Unicamp                           */
/*==================================================================*/

#include<stdio.h>

// Funções primárias
void ShowMainScreen();
int UserTaxPerc(float salary);
float UserNewSalary(float salary);
int UserSalaryClass(float salary);

#pragma region MAIN_FUNCTION
int main()
{
	// Enumeration do sistema
	enum Options { Invalid, TaxPerc, NewSalary, SallClass };
	enum Options userTask = Invalid;
	
	// Enquanto o usuário não selecionar nenhuma opção válida
	while(userTask == Invalid)
	{
		int _taskUserId;
		
		// Mostrar o Menu Inicial
		ShowMainScreen();
		printf("-> ");
		scanf("%d", &_taskUserId);
		
		// Atribuir a opção escolhida
		if(_taskUserId == 1)		userTask = TaxPerc;
		else if(_taskUserId == 2) 	userTask = NewSalary;
		else if(_taskUserId == 3) 	userTask = SallClass;
		else 
		{
			userTask = Invalid;
			printf("Opcao invalida!\n");
		}
	}
	
	// Executar a função
	switch(userTask)
	{
		float _userSalary;
		
		case TaxPerc:
			
			// Coletar o valor inserido pelo usuário
			printf("Digite o valor do seu salario: R$");
			scanf("%f", &_userSalary);
			
			// Determinar os valores
			int _taxPerc = UserTaxPerc(_userSalary);
			printf("Percentual do imposto: %d%%\n", _taxPerc);
			
			break;
			
		case NewSalary:
			
			// Coletar o valor inserido pelo usuário
			printf("Digite o valor do seu salario: R$");
			scanf("%f", &_userSalary);
			
			// Determinar os valores
			float _newSalary = UserNewSalary(_userSalary);
			printf("Novo salario: R$%.2f\n", _newSalary);
			
			break;
			
		case SallClass:
			
			// Coletar o valor inserido pelo usuário
			printf("Digite o valor do seu salario: R$");
			scanf("%f", &_userSalary);
			
			// Determinar a classe da classificação
			int _userSalaryClass = UserSalaryClass(_userSalary);
			switch(_userSalaryClass)
			{
				case 0:
					printf("Mal remunerado\n");
					break;
				case 1:
					printf("Bem remunerado\n");
					break;
			}
			
			break;
	}	
	
	return 0;
}
#pragma endregion

#pragma region PRIMARY_FUNCTIONS
void ShowMainScreen()
{
	printf("Menu de opcoes:\n");
	printf("\t1. Imposto\n");
	printf("\t2. Novo salario\n");
	printf("\t3. Classificacao\n");
}

int UserTaxPerc(float salary)
{
	return salary < 500 ? 5 : salary >= 500 && salary <= 850 ? 10 : 15;
}

float UserNewSalary(float salary)
{
	float _add, _newSalary;
	
	if(salary >= 1500) 						_add = 25;
	else if(salary >= 750 && salary < 1500) _add = 50;
	else if(salary >= 450 && salary < 750) 	_add = 75;
	else if(salary < 450) 					_add = 100;
	
	_newSalary = salary + _add;
	
	return _newSalary;
}

int UserSalaryClass(float salary)
{
	return salary <= 700 ? 0 : 1;
}
#pragma endregion
