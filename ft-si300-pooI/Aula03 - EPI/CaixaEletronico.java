import java.math.BigDecimal;

/**
 * <h1>Programa��o Orientada a Objetos I - Unicamp</h1>
 * 
 * Exerc�cio Programa 1
 * 
 * Caixa Eletronico:
 * Consulta, pagamento, transferencia, sacar, depositar
 * 
 * @author Victor Yukio Shirasuna, RA: 245155
 * @version 0.0.1
 */
public class CaixaEletronico 
{
	private String nome;
	private int numConta;
	private BigDecimal saldo;
	
	public static void main(String[] args)
	{
		CaixaEletronico c1 = new CaixaEletronico("Victor", 1001, new BigDecimal(100.00));
		CaixaEletronico c2 = new CaixaEletronico("Abel", 1002, new BigDecimal(200.00));
		
		c1.consultar();
		c2.consultar();
		
		pagar(c1, new BigDecimal(20.00));
		fazerTransferencia(c1, c2, new BigDecimal(30.00));
		
		c1.consultar();
		c2.consultar();
		
		sacar(c1, new BigDecimal(50.00));
		depositar(c1, new BigDecimal(300.00));
		
		c1.consultar();
		c2.consultar();
	}
	
	public CaixaEletronico(String nome, int numConta, BigDecimal saldoInicial)
	{
		this.nome = nome;
		this.numConta = numConta;
		this.saldo = saldoInicial;
	}
	
	public void consultar()
	{
		System.out.println("Conta " + numConta + " de " + nome);
		System.out.println("Saldo dispon�vel: \t" + saldo);
		System.out.println("");
	}
	
	public static boolean pagar(CaixaEletronico usuario, BigDecimal valorASerPago)
	{
		if(validarSaldoDisponivel(usuario, valorASerPago))
		{
			usuario.saldo = usuario.saldo.subtract(valorASerPago);
			System.out.println("Pagamento realizado com sucesso!");
			return true;
		}
		else
		{
			System.out.println("Saldo insuficiente");
			return false;
		}
	}
	
	public static boolean fazerTransferencia(CaixaEletronico remetente, CaixaEletronico destinatario, BigDecimal valorASerTransferido)
	{
		if(pagar(remetente, valorASerTransferido))
		{
			destinatario.saldo = destinatario.saldo.add(valorASerTransferido);
			System.out.println("Transfer�ncia realizado com sucesso!");
			return true;
		}
		else
		{
			System.out.println("Erro na transfer�nia.");
			return false;
		}
	}
	
	public static BigDecimal sacar(CaixaEletronico usuario, BigDecimal valorASerSacado)
	{
		BigDecimal valorSacado = BigDecimal.ZERO;
		
		// Verificar se tem o valor desejado no saldo da conta
		if(validarSaldoDisponivel(usuario, valorASerSacado))
		{
			usuario.saldo = usuario.saldo.subtract(valorASerSacado);
			valorSacado = valorASerSacado;
		}
		
		System.out.println("N�mero da conta: \t" + usuario.numConta + "\nValor sacado: \t\t" + valorSacado + "\n");
		
		// Retornar o valor desejado
		return valorSacado;
	}
	
	public static void depositar(CaixaEletronico usuario, BigDecimal valorASerDepositado)
	{
		usuario.saldo = usuario.saldo.add(valorASerDepositado);
		System.out.println("Saldo atualizado com sucesso!");
	}
	
	private static boolean validarSaldoDisponivel(CaixaEletronico usuario, BigDecimal valorASerDescontado)
	{
		// Verificar se tem o valor desejado no saldo da conta
		if(usuario.saldo.compareTo(valorASerDescontado) >= 0)
			return true;
		else
			return false;
	}
}
