import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;

/**
 * <h1>Programação Orientada a Objetos I - Unicamp</h1>
 * 
 * Exercício Programa 2
 * 
 * Contas Banco:
 * Deposito, Retirada, Imprimir Extrato
 * 
 * @author Victor Yukio Shirasuna, RA: 245155
 * @version 0.0.2
 */
public class Main
{
  private static final int OPTION_SAIR_ID = 5;
  static List<ContaBancaria> contasArmazenadas = new ArrayList<ContaBancaria>();

  public static void main(String[] args)
  {
    Scanner scanner = new Scanner(System.in);
    int numeroConta, operacao;

    ContaBancaria c1 = new ContaCorrenteComum(1234, "Victor", 50.00);
    ContaBancaria c2 = new ContaCorrenteLimite(1235, "Victor2", 100.00, 10.00);
    ContaBancaria c3 = new ContaPoupanca(1236, "Victor3", 150.00, "20/04/2021");
    contasArmazenadas.add(c1);
    contasArmazenadas.add(c2);
    contasArmazenadas.add(c3);

    /* MENU */
    System.out.println("Digite o número da conta: ");
    numeroConta = scanner.nextInt();
    ContaBancaria conta = getContaBancaria(numeroConta);

    if(conta == null)
    {
      System.out.println("\nConta não encontrada.");
      scanner.close();
      return;
    }

    do
    {
      System.out.println("Seja bem-vindo(a) " + conta.nomeCorrentista + "!");
      System.out.println("\nDigite a operação:");
      System.out.println("\t1. Deposito");
      System.out.println("\t2. Retirada");
      System.out.println("\t3. Imprimir extrato");
      System.out.println("\t4. Fazer transação");
      System.out.println("\t" + OPTION_SAIR_ID + ". Sair");
      operacao = scanner.nextInt();

      switch(operacao)
      {
        case 1:
          double valorDepositado;

          System.out.println("\n***Operação de Deposito***");
          System.out.println("Digite o valor a ser depositado: ");
          valorDepositado = scanner.nextDouble();

          ContaBancaria.Deposito(numeroConta, valorDepositado);
          break;

        case 2:
          double valorRetirado;

          System.out.println("\n***Operação de Retirada***");
          System.out.println("Digite o valor a ser retirado: ");
          valorRetirado = scanner.nextDouble();

          if(conta instanceof ContaCorrenteLimite)
            ContaCorrenteLimite.Retirada(numeroConta, valorRetirado);
          else
            ContaBancaria.Retirada(numeroConta, valorRetirado);
          break;

        case 3:
          System.out.println("\n***Operação de Imprimir Extrato***");

          if(conta instanceof ContaCorrenteLimite)
            ContaCorrenteLimite.ImprimeExtrato(numeroConta);
          else if(conta instanceof ContaPoupanca)
            ContaPoupanca.ImprimeExtrato(numeroConta);
          else
            ContaBancaria.ImprimeExtrato(numeroConta);
          break;

        case 4:
          String dataTransacao, descricaoTransacao;
          double valorTransacao;

          System.out.println("\n***Operação de Fazer Transacao***");
          System.out.println("Digite o valor a da transação: ");
          valorTransacao = scanner.nextDouble();
          System.out.println("Digite a data hoje: ");
          dataTransacao = scanner.next();
          System.out.println("Digite a descricao da transação: ");
          descricaoTransacao = scanner.next();

          ContaBancaria.FazerTransacao(numeroConta, dataTransacao, valorTransacao, descricaoTransacao);
          System.out.println("Transação realizada com sucesso!");
          break;
      }
    }
    while(operacao != OPTION_SAIR_ID);

    scanner.close();
  }

  public static ContaBancaria getContaBancaria(int numConta)
  {
    ContaBancaria contaBuscada = contasArmazenadas.stream()
                                .filter(o -> o.numConta == numConta)
                                .findAny()
                                .orElse(null);

    return contaBuscada;
  }
}