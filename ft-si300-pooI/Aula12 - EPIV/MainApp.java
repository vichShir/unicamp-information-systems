/**
 * <h1>Programação Orientada a Objetos I - Unicamp</h1>
 *
 * Exercício Programa 4
 *
 * Tratamento de Exceções
 *
 * @author Victor Yukio Shirasuna, RA: 245155
 * @version 0.0.1
 */
public class MainApp
{
    public static void main(String[] args)
    {
        CharacterController myCharacter = new CharacterController("Victor", 23.5, 100.00, 10.00);
        PlayerController player = new PlayerController("Yukio", 60.9, 100.00, Feelings.feelings.HAPPY);

        System.out.println(myCharacter.getName());
        System.out.println(myCharacter.getAttack());
        System.out.println(player.getName());
        System.out.println(player.getName() + " está se sentindo " + player.getMyFeeling());
    }
}
