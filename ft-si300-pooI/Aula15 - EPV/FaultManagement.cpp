#include <iostream>
#include "Header Files/FaultManagement.h"

using namespace std;

// Getters
float FaultManagement::GetOilPressure()
{
  return oilPressure;
}

float FaultManagement::GetBatteryVoltage()
{
  return batteryVoltage;
}

float FaultManagement::GetOilTemperature()
{
  return transmissionOilTemp;
}

// Conferir se a pressao do oleo está entre os valores recomendados
bool FaultManagement::IsOilPressureOK()
{
  return (oilPressure >= MIN_OIL_PRESSURE && oilPressure <= MAX_OIL_PRESSURE) ? true : false;
}

// Conferir se a temperatura do oleo da transmissão está abaixo do recomendado
bool FaultManagement::IsTransmOilTemperatureOK()
{
  return (transmissionOilTemp <= MAX_TRANSM_OIL_TEMP) ? true : false;
}

// Conferir se a tensao da bateria está acima do operavel
bool FaultManagement::IsBatteryVoltageOK()
{
  return (batteryVoltage >= MIN_BATTERY_VOLTAGE) ? true : false;
}

// Conferir se a pressao dos pneus estão dentro do recomendado
bool FaultManagement::IsTirePressureOK()
{
  return (tirePressure == NORMAL_TIRE_PRESSURE) ? true : false;
}

// Conferir se o nivel do oleo está acima do minimo
bool FaultManagement::IsOilLevelOK()
{
  return (oilLevel >= MIN_OIL_LEVEL) ? true : false;
}

// Conferir se as pastilhas de freio estão acima do minimo
bool FaultManagement::IsBreakPadsOK()
{
  return (breakPadsLevel >= MIN_BREAK_PADS_LEVEL) ? true : false;
}

void FaultManagement::PrintReport(const char* report)
{
  std::cout << "-> Fault Management Report:" << std::endl;
  std::cout << "\t -> " << report << std::endl;
}

// Detectar algum problema não crucial no carro e reporta-lo
bool FaultManagement::CarHasAnyProblem()
{
  bool anyProblem = false;

  // Conferir pressao dos pneus
  try
  {
    if(!IsTirePressureOK())
      throw "Verificar a pressao dos pneus baixas!";
  }
  catch(const char* e)
  {
    anyProblem = true;
    PrintReport(e);
  }

  // Conferir o nivel do oleo
  try
  {
    if(!IsOilLevelOK())
      throw "Verificar o nivel do oleo baixo!";
  }
  catch(const char* e)
  {
    anyProblem = true;
    PrintReport(e);
  }

  // Conferir o nivel das pastilhas de freio
  try
  {
    if(!IsBreakPadsOK())
      throw "Verificar o nivel das pastilhas de freios baixas!";
  }
  catch(const char* e)
  {
    anyProblem = true;
    PrintReport(e);
  }

  return anyProblem;
}

// Detectar algum problema crucial no carro e reporta-lo
bool FaultManagement::HasCrucialProblems()
{
  bool anyCrucialProblem = false;

  //Conferir Pressao do oleo
  try
  {
    if(!IsOilPressureOK())
      throw "Problema Crucial na pressao do oleo!";
  }
  catch(const char* e)
  {
    anyCrucialProblem = true;
    PrintReport(e);
  }

  // Conferir Temperatura do oleo da transmissao
  try
  {
    if(!IsTransmOilTemperatureOK())
      throw "Problema Crucial na temperatura do oleo da transmissao!";
  }
  catch(const char* e)
  {
    anyCrucialProblem = true;
    PrintReport(e);
  }

  // Conferir tensao da bateria
  try
  {
    if(!IsBatteryVoltageOK())
      throw "Problema Crucial com a bateria com tensao baixa!";
  }
  catch(const char* e)
  {
    anyCrucialProblem = true;
    PrintReport(e);
  }

  return anyCrucialProblem;
}