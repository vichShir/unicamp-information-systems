#include <iostream>
#include <string>
#include "Header Files/Vehicles.h"

using namespace std;

// Getters and Setters
void Car::SetCarBrand(string brandName)
{
  Car::brand = brandName;
}

string Car::GetCarBrand()
{
  return brand;
}

void Car::SetCarModel(string modelName)
{
  Car::model = modelName;
}

string Car::GetCarModel()
{
  return model;
}

void Car::SetCarColor(Color carColor)
{
  Car::color = carColor;
}

string Car::GetCarColor()
{
  switch(Car::color)
  {
    case 1:
      return "Grey";
      break;
    case 2:
      return "Black";
      break;
    case 3:
      return "White";
      break;
    case 4:
      return "Blue";
      break;
    case 5:
      return "Red";
      break;
    case 6:
      return "Silver";
      break;
    default:
      return 0;
  }
}

void Car::SetCarModelYear(int modelYear)
{
  Car::year = modelYear;
}

int Car::GetCarModelYear()
{
  return year;
}

string Car::GetSpecifications()
{
  string specifications = "Marca: " + GetCarBrand() + "\n" +
                          "Modelo: " + GetCarModel() + "\n" +
                          "Color: " + GetCarColor() + "\n" +
                          "Ano do Modelo: " + to_string(GetCarModelYear()) + "\n";

  return specifications;
}

void Car::SetCarEngineStarted(bool hasStarted)
{
  engineStarted = hasStarted;
}

bool Car::GetCarEngineState()
{
  return engineStarted;
}

void Car::TurnOn()
{
  if(!BoardComputer::HasCrucialProblems()) // Verificar apenas os problemas cruciais
  {
    cout << "Ligando Carro..." << "\n";
    SetCarEngineStarted(true);  // Ligar o carro fisicamente
  }
  else
    cout << "Impossivel ligar o carro." << "\n";
}

void Car::ShowCarPerformance()
{
  std::cout << "Velocidade:           " << GetVelocity() << " Km/h" << endl;
  std::cout << "Temperatura Motor:    " << ReadEngineTemperature(GetVelocity()) << " C" << endl;
  std::cout << "Rotacoes do Motor:    " << ReadEngineRPM(GetVelocity()) << " RPM" << endl;
  std::cout << "Pressao Oleo:         " << GetOilPressure() << " Bar" << endl;
  std::cout << "Temperatura Oleo:     " << GetOilTemperature() << " C" << endl;
  std::cout << "Tensao da Bateria:    " << GetBatteryVoltage() << " Volts" << endl;
  std::cout << "Distancia Percorrida: " << GetDistance() << " m" << endl;
  std::cout << "Tempo Percorrido:     " << GetDeltaTime() << " s" << endl;
  std::cout << "Data:                 " << GetDateTime() << endl;
  ReturnToMainMenu();
}

void Car::ShowSpecifications()
{
  std::cout << GetSpecifications() << endl;
  ReturnToMainMenu();
}

void Car::ShowFaultManagement()
{
  if(!BoardComputer::ReportedAnyProblem())
  {
    cout << "Tudo está Ok!" << endl;
  }
  else
  {
    cout << "Problema(s) relatado(s)." << endl;
  }

  ReturnToMainMenu();
}

void Car::ShutDown()
{
  engineStarted = false;
} 

void Car::TurnOnBoardComputer()
{
  if(!engineStarted)  return;

  short option;
  do
  {
    ShowMainMenu(); // Mostrar a interface do Computador de Bordo
    option = GetOptionFromInput();

    switch(option)
    {
      case 1:
        ClearScreen();
        ShowCarPerformance();
        break;
      case 2:
        ClearScreen();
        ShowFaultManagement();
        break;
      case 3:
        ClearScreen();
        ShowSpecifications();
        break;
      case 4:
        ClearScreen();
        SpeedUp(ConvertPedalForceToVelocity(), GetPedalDeltaTime());
        ReturnToMainMenu();
        ClearScreen();
        ShowCarPerformance();
        break;
      case 5:
        ClearScreen();
        Break(ConvertPedalForceToVelocity(), GetPedalDeltaTime());
        ReturnToMainMenu();
        ClearScreen();
        ShowCarPerformance();
        break;
      case EXIT_OPTION:
        ShutDown();
        break;
      default:
        ClearScreen();
        cout << "Opcao nao reconhecida. Tente novamente." << endl;
        ReturnToMainMenu();
        break;
    }

    cout << "Pressione <Enter> para voltar." << endl;
    ClearScreen();

  } while(option != EXIT_OPTION);
}

void Car::SpeedUp(float addVelocity, float time)
{
  AddTime(time);
  SetVelocity(GetVelocity() + addVelocity);
}

void Car::Break(float subVelocity, float time)
{
  AddTime(time);

  if(GetVelocity() >= subVelocity)
  {
    SetVelocity(GetVelocity() - subVelocity);
  }
  else
  {
    SetVelocity(0);
  }
}