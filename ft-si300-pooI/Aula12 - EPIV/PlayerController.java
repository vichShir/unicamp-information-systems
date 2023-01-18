public class PlayerController implements Feelings
{
    private String name;
    private boolean isAlive;
    private double attack;
    private double life;

    private feelings myFeeling;

    public PlayerController(String name, double attack, double life, feelings initialFeeling) {
        isAlive = true;
        this.name = name;
        IncreaseAttackStrength(attack);
        IncreaseLife(life);
        setMyFeeling(initialFeeling);
    }

    private void Damage(double damage) {
        if (damage <= life)
            life -= damage;
        else
            isAlive = false;
    }

    private void AttackStrength(double atk) {
        attack += atk;
    }

    private void IncreaseLife(double life) {
        this.life += life;
    }

    public void TakeDamage(double damage) {
        Damage(damage);
    }

    public void IncreaseAttackStrength(double atk) {
        AttackStrength(atk);
    }

    public void HealCharacter(double life) {
        IncreaseLife(life);
    }

    public String getName() {
        return name;
    }

    public boolean isAlive() {
        return isAlive;
    }

    public double getAttack() {
        return attack;
    }

    public double getLife() {
        return life;
    }

    public feelings getMyFeeling() {
        return myFeeling;
    }

    public void setMyFeeling(feelings myFeeling) {
        this.myFeeling = myFeeling;
    }
}
