/*==================================================================*/
/*             Lista 2 Programa Exercício 2 - Finanças              */
/* -> Jônatas Goes da Silva - FT Unicamp                            */
/* -> Felipe Eduardo - FT Unicamp                                   */
/* -> Victor Yukio Shirasuna - FT Unicamp                           */
/*==================================================================*/

#include<stdio.h>

// Procedimentos da interface
void ShowMainScreen();
void OptionOne(float _userSalary);
void OptionTwo(float _userSalary);
void OptionThree(float _userSalary);

// Função de operação
float UserTax(float salary);

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
	float _userSalary;
	switch(userTask)
	{
		case TaxPerc:
			OptionOne(_userSalary);
			break;
			
		case NewSalary:
			OptionTwo(_userSalary);
			break;
			
		case SallClass:	
			OptionThree(_userSalary);
			break;
	}	
	
	return 0;
}
#pragma endregion

#pragma region PROCEDURES_FUNCTIONS
void ShowMainScreen()
{
	printf("Menu de opcoes:\n");
	printf("\t1. Imposto\n");
	printf("\t2. Novo salario\n");
	printf("\t3. Classificacao\n");
}

void OptionOne(float _userSalary)
{
	// Coletar o valor inserido pelo usuário
	printf("Digite o valor do seu salario: R$");
	scanf("%f", &_userSalary);
	
	// Determinar o imposto a ser pago
	float _tax = UserTax(_userSalary);
	printf("Valor do Imposto: R$%.2f\n", _tax);
}

void OptionTwo(float _userSalary)
{
	// Coletar o valor inserido pelo usuário
	printf("Digite o valor do seu salario: R$");
	scanf("%f", &_userSalary);
	
	/* Processamento do aumento */
	// Variáveis do |aumento| e do |salário com o aumento|
	float _add, _newSalary;
	
	// Determinar o aumento
	if(_userSalary >= 1500) 							_add = 25;
	else if(_userSalary >= 750 && _userSalary < 1500) 	_add = 50;
	else if(_userSalary >= 450 && _userSalary < 750) 	_add = 75;
	else if(_userSalary < 450) 							_add = 100;
	
	// Determinar o salário com o aumento
	_newSalary = _userSalary + _add;
	
	/* Imprimir o novo salário */
	printf("Novo salario: R$%.2f\n", _newSalary);
}

void OptionThree(float _userSalary)
{
	// Coletar o valor inserido pelo usuário
	printf("Digite o valor do seu salario: R$");
	scanf("%f", &_userSalary);
	
	/* Processamento da classificação */
	int _userSalaryClass = _userSalary <= 700 ? 0 : 1;
	
	// Imprimir o resultado da classificação
	if (_userSalaryClass == 0)
		printf("Mal remunerado\n");
	else if(_userSalaryClass == 1)
		printf("Bem remunerado\n");
}
#pragma endregion

#pragma region OPERATIONAL_FUNCTIONS
float UserTax(float salary)
{
	int _taxPerc = salary < 500 ? 5 : salary >= 500 && salary <= 850 ? 10 : 15;
	return salary * (float)_taxPerc/100;
}
#pragma endregion
