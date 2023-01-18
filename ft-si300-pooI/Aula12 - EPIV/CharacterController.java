public class CharacterController
{
    private String name;
    private boolean isAlive;
    private double attack;
    private double life;
    private double shield;
    private double hungry;
    private double thirst;

    public CharacterController(String name, double attack, double life, double shield) {
        isAlive = true;
        this.hungry = 0;
        this.thirst = 0;
        this.name = name;
        this.attack = attack;
        this.life = life;
        this.shield = shield;
    }

    private void Damage(double damage) {
        if(damage <= shield)
            shield -= damage;
        else if (shield <= 0 && damage <= life)
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

    private void IncreaseHungry(double hg) {
        this.hungry += hg;
    }

    private void IncreaseThirst(double th) {
        this.thirst += th;
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

    public void FeelHungry(double hg) {
        IncreaseHungry(hg);
    }

    public void FeelThirst(double th) {
        IncreaseThirst(th);
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

    public double getShield() {
        return shield;
    }

    public double getHungry() {
        return hungry;
    }

    public double getThirst() {
        return thirst;
    }
}
