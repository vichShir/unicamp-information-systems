#include <string>
#include "FaultManagement.h"
#include "PerformanceManagement.h"

#define EXIT_OPTION 6

class BoardComputer : public PerformanceManagement, public FaultManagement
{
  private:
    float pedalForce;
    float pedalDeltaTime;

  protected:
    std::string GetUserInput();
    bool ReportedAnyProblem();
  
  public:
    // Getters and Setters
    void SetPedalForce(float force);
    float GetPedalForce();
    void SetPedalDeltaTime(float deltaTime);
    float GetPedalDeltaTime();

    void ShowMainMenu();
    void ClearScreen();
    void ReturnToMainMenu();
    void GetInputFromPedal();
    short GetOptionFromInput();
    float ConvertPedalForceToVelocity();
    virtual void ShowSpecifications();
    virtual void TurnOnBoardComputer();
};