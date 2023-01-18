class PerformanceManagement
{
  private:
    float engineTemp = 20;
    float velocity = 0;
    float distance = 0;
    float deltaTime = 0;
    int engineRPM = 0;

    void CalculateDistance();

  public:
    void SetEngineTemperature(float temperature);
    float GetEngineTemperature();
    void SetVelocity(float toVelocity);
    float GetVelocity();
    void AddTime(float addTime);
    float GetDeltaTime();
    void SetEngineRPM(int rpm);
    int GetEngineRPM();
    float GetDistance();

    std::string ReadEngineTemperature(float carVelocity);
    std::string ReadEngineRPM(float carVelocity);
    std::string GetDateTime();
};