public class ContaCorrenteComum extends ContaBancaria
{
  public ContaCorrenteComum(int numConta, String nomeCorrentista, double saldo)
  {
    super(numConta, nomeCorrentista, saldo);
  }

  public static void ImprimeExtrato(int numConta)
  {
    ContaBancaria conta = Main.getContaBancaria(numConta);
    StringBuilder extrato = new StringBuilder();

    extrato.append("\nNúmero da Conta:  " + conta.numConta);
    extrato.append("\nCliente:          " + conta.nomeCorrentista);
    extrato.append("\nSaldo:            " + conta.saldo);
    extrato.append("\nTransacoes:       " + conta.getTransacoes());

    System.out.println(extrato.toString());
  }
}