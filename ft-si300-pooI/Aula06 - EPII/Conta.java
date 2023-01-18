public interface Conta
{
  static void Deposito(int numConta, double valorDepositado) {}
  static void Retirada(int numConta, double valorDeRetirada) {}
  static void ImprimeExtrato(int numConta) {}
  static void FazerTransacao(int numConta, String data, double valor, String descricao) {}
}