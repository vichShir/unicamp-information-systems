import java.util.ArrayList;
import java.util.List;

public class ContaBancaria implements Conta
{
  protected int numConta;
  protected String nomeCorrentista;
  protected double saldo;
  protected List<ListaTransacoes> transacoes;

  public ContaBancaria(int numConta, String nomeCorrentista, double saldo)
  {
    this.numConta = numConta;
    this.nomeCorrentista = nomeCorrentista;
    this.saldo = saldo;
    transacoes = new ArrayList<ListaTransacoes>();
  }

  protected double getSaldo()                   { return saldo; }
  protected void updateSaldo(double novoSaldo)  { this.saldo += novoSaldo; }

  public String getTransacoes()
  {
    StringBuilder descricaoTransacoes = new StringBuilder();

    if(transacoes.size() > 0)
      transacoes.stream().forEach(o -> descricaoTransacoes.append(o));
    else
      descricaoTransacoes.append("Nenhuma transação efetuada pela conta.");

    return descricaoTransacoes.toString();
  }

  public static void FazerTransacao(int numConta, String data, double valor, String descricao)
  {
    ContaBancaria conta = Main.getContaBancaria(numConta);
    ListaTransacoes novaTransacao = new ListaTransacoes(data, valor, descricao);
    conta.transacoes.add(novaTransacao);
  }

  public static void Deposito(int numConta, double valorDepositado)
  {
    ContaBancaria conta = Main.getContaBancaria(numConta);

    System.out.println("Saldo pré-deposito: " + conta.getSaldo());
    conta.saldo += valorDepositado;
    System.out.println("Saldo pós-deposito: " + conta.getSaldo());
  }

  public static void Retirada(int numConta, double valorDeRetirada)
  {
    ContaBancaria conta = Main.getContaBancaria(numConta);

    System.out.println("Saldo pré-retirada: " + conta.getSaldo());

    if(conta.getSaldo() >= valorDeRetirada)
      conta.updateSaldo(valorDeRetirada);
    
    System.out.println("Saldo pós-retirada: " + conta.getSaldo());
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