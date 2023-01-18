#define MIN_OIL_PRESSURE 8
#define MAX_OIL_PRESSURE 10

#define MAX_TRANSM_OIL_TEMP 95
#define MIN_BATTERY_VOLTAGE 12

#define NORMAL_TIRE_PRESSURE 32
#define MIN_OIL_LEVEL 60
#define MIN_BREAK_PADS_LEVEL 50

class FaultManagement
{
  private:
    float oilPressure = 8;
    float transmissionOilTemp = 45;
    float batteryVoltage = 13.4;
    float tirePressure = 31;
    float oilLevel = 40;
    float breakPadsLevel = 40;

    bool IsOilPressureOK();
    bool IsTransmOilTemperatureOK();
    bool IsBatteryVoltageOK();
    bool IsTirePressureOK();
    bool IsOilLevelOK();
    bool IsBreakPadsOK();
    void PrintReport(const char* report);    
  
  protected:
    // Getters
    float GetOilPressure();
    float GetBatteryVoltage();
    float GetOilTemperature();

    bool CarHasAnyProblem();
    bool HasCrucialProblems();
};