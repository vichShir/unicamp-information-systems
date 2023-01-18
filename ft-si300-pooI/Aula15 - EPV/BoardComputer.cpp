#include <iostream>
#include <string>
#include <cstdlib>
#include "Header Files/BoardComputer.h"

using namespace std;

// Getters and Setters
void BoardComputer::SetPedalForce(float force)
{
  if(force > 100)
    force = 100;
  else if(force < 0)
    force = 0;
  
  pedalForce = force;
}

float BoardComputer::GetPedalForce()
{
  return pedalForce;
}

void BoardComputer::SetPedalDeltaTime(float deltaTime)
{
  pedalDeltaTime = deltaTime;
}

float BoardComputer::GetPedalDeltaTime()
{
  return pedalDeltaTime;
}

bool BoardComputer::ReportedAnyProblem()
{
  return CarHasAnyProblem();
}

void BoardComputer::ShowMainMenu()
{
  cout << "<<Computador de Bordo>>" << endl;
  cout << "<<-----Bem vindo----->>" << endl;
  cout << "\t" << "1. Verificar Desempenho." << endl;
  cout << "\t" << "2. Verificar Falhas." << endl;
  cout << "\t" << "3. Ver Especificacoes." << endl;
  cout << "\t" << "4. Acelerar." << endl;
  cout << "\t" << "5. Frear." << endl;
  cout << "\t" << "6. Desligar Carro." << endl;
}

string BoardComputer::GetUserInput()
{
  string userInput;
  cin >> userInput;
  return userInput;
}

short BoardComputer::GetOptionFromInput()
{
  cout << "Digite a opcao desejada:" << endl;
  short option = stoi(GetUserInput());
  return option;
}

void BoardComputer::ClearScreen()
{
  system("clear||cls");
}

void BoardComputer::ReturnToMainMenu()
{
  cout << "Pressione <Enter> para voltar." << endl;
  while(getchar()!='\n'); // option TWO to clean stdin
  getchar(); // wait for ENTER
}

void BoardComputer::GetInputFromPedal()
{
  cout << "Digite (Pressione) o valor do pedal do acelerador (0-100):" << endl;
  SetPedalForce(stoi(GetUserInput()));
  SetPedalDeltaTime(rand() % 6);
}

float BoardComputer::ConvertPedalForceToVelocity()
{
  GetInputFromPedal();
  float velocity = ((GetPedalForce() / 10) * 2) + (rand() % 10);
  return velocity;
}

void BoardComputer::ShowSpecifications()
{
  cout << "Computador de Bordo v1.0" << endl;
  ReturnToMainMenu();
}

void BoardComputer::TurnOnBoardComputer()
{
  short option;
  do
  {
    ShowMainMenu();
    option = GetOptionFromInput();

    switch(option)
    {
      case 2:
        ClearScreen();
        break;
      case 3:
        ClearScreen();
        ShowSpecifications();
        break;
    }

    cout << "Pressione <Enter> para voltar." << endl;
    ClearScreen();

  } while(option != 4);
}