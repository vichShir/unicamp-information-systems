#include <string>
#include "BoardComputer.h"

using namespace std;
enum Color { GREY = 1, BLACK, WHITE, BLUE, RED, SILVER };

class Car : public BoardComputer
{
  private:
    string brand;   
    string model;
    Color color;
    int year;
    bool engineStarted;

    // Setters
    void SetCarBrand(string brandName);
    void SetCarModel(string modelName);
    void SetCarColor(Color carColor);
    void SetCarModelYear(int modelYear);
    void SetCarEngineStarted(bool hasStarted);

  public:
    // Getters
    string GetCarBrand();
    string GetCarModel();
    string GetCarColor();
    string GetSpecifications();
    bool GetCarEngineState();
    int GetCarModelYear();

    void ShowCarPerformance();
    void ShowFaultManagement();
    void ShowSpecifications();
    void TurnOnBoardComputer();

    void TurnOn();
    void ShutDown();

    void SpeedUp(float addVelocity, float time);
    void Break(float subVelocity, float time);

    // Constructor
    Car(string brandName, string modelName, Color carColor, int modelYear)
    {
      SetCarBrand(brandName);
      SetCarModel(modelName);
      SetCarColor(carColor);
      SetCarModelYear(modelYear);
      SetCarEngineStarted(false);
    }
};