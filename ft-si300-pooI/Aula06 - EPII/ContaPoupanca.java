public class ContaPoupanca extends ContaBancaria
{
  private String diaAniversario;

  public ContaPoupanca(int numConta, String nomeCorrentista, double saldo, String diaAniversario)
  {
    super(numConta, nomeCorrentista, saldo);
    this.diaAniversario = diaAniversario;
  }

  public static void ImprimeExtrato(int numConta)
  {
    ContaPoupanca conta = (ContaPoupanca)Main.getContaBancaria(numConta);
    StringBuilder extrato = new StringBuilder();

    extrato.append("\nNúmero da Conta:  " + conta.numConta);
    extrato.append("\nCliente:          " + conta.nomeCorrentista);
    extrato.append("\nSaldo:            " + conta.saldo);
    extrato.append("\nDia aniversário:  " + conta.diaAniversario);
    extrato.append("\nTransacoes:       " + conta.getTransacoes());

    System.out.println(extrato.toString());
  }
}