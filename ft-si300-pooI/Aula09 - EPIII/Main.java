/**
 * <h1>Programação Orientada a Objetos I - Unicamp</h1>
 *
 * Exercício Programa 3
 *
 * Tratamento de Exceções
 *
 * @author Victor Yukio Shirasuna, RA: 245155
 * @version 0.0.1
 */
public class Main
{
    public static void main(String[] args)
    {
        Tab tabPtr = new Tab();

        try
        {
            int N = 1000;       // Tamanho da matriz
            tabPtr.setSize(N);
            tabPtr.fillMatrixWithRandomNumbers();
            tabPtr = null;      // Forçando falta de memória

            System.out.println("Tamanho da Matriz: " + tabPtr.getSize());

            // Modificando elemento da matriz
            int row = 1000, column = 1000;
            try
            {
                // Tentar alterar posicao com numero aleatorio
                tabPtr.setMatrixElement(row, column, tabPtr.getRandomNumber(0, 100));

                // Visualizando os elementos da matriz
                for(Integer[] rowV : tabPtr.V)
                {
                    for (Integer value : rowV)
                    {
                        if (value == null)
                        {
                            System.out.println("Erro! Valor da Matriz não encontrado!");
                        }
                        else
                        {
                            System.out.println("Valor da Super Sena: " + value);
                        }
                    }
                }
            }
            catch (ArrayIndexOutOfBoundsException e)
            {
                System.out.println("Erro! Posição da Matriz (" + row + ", " + column + ") não encontrada!");
                System.out.println("Tente acessar os elementos até a posição: (" + (tabPtr.getSize()-1) + ", " + (tabPtr.getSize()-1) + ")!");
                e.printStackTrace();
            }
        }
        catch (NullPointerException e)
        {
            System.out.println("Erro! Matriz não encontrada! Ponteiro nulo!");
            e.printStackTrace();
        }
    }
}
