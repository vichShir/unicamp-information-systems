#include <iostream>
#include <cmath>
#include <string>
#include <ctime>
#include "Header Files/PerformanceManagement.h"

using namespace std;

// Getters and Setters
void PerformanceManagement::SetEngineTemperature(float temperature)
{
  engineTemp = temperature;
}

float PerformanceManagement::GetEngineTemperature()
{
  return engineTemp;
}

void PerformanceManagement::SetVelocity(float toVelocity)
{
  velocity = toVelocity;
}

float PerformanceManagement::GetVelocity()
{
  return velocity;
}

void PerformanceManagement::AddTime(float addTime)
{
  deltaTime += addTime;
}

float PerformanceManagement::GetDeltaTime()
{
  return deltaTime;
}

void PerformanceManagement::SetEngineRPM(int rpm)
{
  engineRPM = rpm;
}

int PerformanceManagement::GetEngineRPM()
{
  return engineRPM;
}

std::string PerformanceManagement::ReadEngineTemperature(float carVelocity)
{
  float temp = pow(carVelocity, 1.08) + 20;
  SetEngineTemperature(temp);

  string readTemp = to_string(GetEngineTemperature());
  return readTemp;
}

std::string PerformanceManagement::ReadEngineRPM(float carVelocity)
{
  int rpm = (int)pow(carVelocity, 1.9);
  SetEngineRPM(rpm);

  string readRPM = to_string(GetEngineRPM());
  return readRPM;
}

void PerformanceManagement::CalculateDistance()
{
  distance =  (GetVelocity() / 3.6) * GetDeltaTime();
}

float PerformanceManagement::GetDistance()
{
  CalculateDistance();
  return distance;
}

string PerformanceManagement::GetDateTime()
{
  time_t now = time(0);
  char* dt = ctime(&now);
  return dt;
}