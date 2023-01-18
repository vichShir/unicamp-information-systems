public class Tab
{
    int N;
    Integer V[][] = new Integer[N][N];

    public int getSize()
    {
        return N;
    }

    public void setSize(int N)
    {
        this.N = N;
    }

    public void fillMatrixWithRandomNumbers()
    {
        // Matrix Auxiliar com numeros aleatorios
        Integer A[][] = new Integer[N][N];
        for(int i = 0; i < N; i++)
            for(int j = 0; j < N; j++)
                A[i][j] = getRandomNumber(0, 100);

        A[0][0] = null; // Forcando primeiro elemento nulo

        // Definindo a Matriz V igual a Matriz A
        this.V = A;
    }

    public int getRandomNumber(int min, int max)
    {
        return (int) ((Math.random() * (max - min)) + min);
    }

    public void setMatrixElement(int row, int column, int newValue)
    {
        this.V[row][column] = newValue;
    }
}
