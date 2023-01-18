public class ContaCorrenteLimite extends ContaBancaria
{
  private double valorLimite;

  public ContaCorrenteLimite(int numConta, String nomeCorrentista, double saldo, double valorLimite)
  {
    super(numConta, nomeCorrentista, saldo);
    this.valorLimite = valorLimite;
  }

  public static void Retirada(int numConta, double valorDeRetirada)
  {
    ContaCorrenteLimite conta = (ContaCorrenteLimite)Main.getContaBancaria(numConta);

    System.out.println("Saldo pré-retirada: " + conta.getSaldo());
    
    if((conta.getSaldo() - valorDeRetirada) >= conta.valorLimite)
      conta.updateSaldo(valorDeRetirada);
    else
      System.out.println("Valor de Retirada acima do valor limite");

    System.out.println("Saldo pós-retirada: " + conta.getSaldo());
  }

  public static void ImprimeExtrato(int numConta)
  {
    ContaCorrenteLimite conta = (ContaCorrenteLimite)Main.getContaBancaria(numConta);
    StringBuilder extrato = new StringBuilder();

    extrato.append("\nNúmero da Conta:  " + conta.numConta);
    extrato.append("\nCliente:          " + conta.nomeCorrentista);
    extrato.append("\nSaldo:            " + conta.saldo);
    extrato.append("\nValor limite:     " + conta.valorLimite);
    extrato.append("\nTransacoes:       " + conta.getTransacoes());

    System.out.println(extrato.toString());
  }
}