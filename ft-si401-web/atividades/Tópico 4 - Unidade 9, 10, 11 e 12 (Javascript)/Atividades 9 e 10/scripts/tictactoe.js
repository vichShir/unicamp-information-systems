/**
 * Author: Victor Yukio Shirasuna, RA: 245155
 * Script Jogo da Velha
 */

// Simbolos
var playerA = "X";
var playerB = "O";

// Posicoes dos jogadores
var allPosA = [];
var allPosB = [];

// Controle do jogo
var maxTurns = 9
var totalTurns = 0;
var vezA = true;
var turnText = "Vez jogador "

// Possibilidades de posicoes para ganhar
var numToWin = 3
var winPossibilities = [["tb11", "tb12", "tb13"], 
					   ["tb21", "tb22", "tb23"],
					   ["tb31", "tb32", "tb33"],
					   ["tb11", "tb21", "tb31"],
					   ["tb12", "tb22", "tb32"],
					   ["tb13", "tb23", "tb33"],
					   ["tb13", "tb22", "tb31"],
					   ["tb11", "tb22", "tb33"]]

// Comecar pelo jogador A
document.getElementById("vez-jogador").innerHTML = turnText + playerA;

/**
 * - Esta funcao executa a cada vez que cada jogador clicar no tabuleiro:
 * Registra a escolha do jogador no tabuleiro,
 * Altera a vez para o proximo jogador,
 * Verifica se o jogador ganhou
 */
function turn(id)
{
	if (document.getElementById(id).innerHTML == "")
	{
		totalTurns++;

		if (vezA)
		{
			vezA = false;
			document.getElementById(id).innerHTML = playerA;
			document.getElementById("vez-jogador").innerHTML = turnText + playerB;
			allPosA.push(id);

			win(allPosA);
		}
		else
		{
			vezA = true;
			document.getElementById(id).innerHTML = playerB;
			document.getElementById("vez-jogador").innerHTML = turnText + playerA;
			allPosB.push(id);

			win(allPosB);
		}
	}
}

/**
 * - Esta funcao verifica se o jogador ganhou:
 * Verifica cada posicao registrada e compara com as possibilidades,
 * Verifica se a pontuacao exigida foi alcancada,
 * Verifica se houve empate
 */
function win(posicoes)
{
	var points = 0;
	var win = false;

	for(var j = 0; j < winPossibilities.length; j++)
	{
		for(var i = 0; i < posicoes.length; i++)
		{
			if(winPossibilities[j].includes(posicoes[i]))
			{
				points++;
			}
		}

		if(points == numToWin)
		{
			if(vezA)
			{
				alert("Jogador O ganhou!!!");
				document.location.reload(true);
				win = true;
			}
			else
			{
				alert("Jogador X ganhou!!!");
				document.location.reload(true);
				win = true;
			}
		}

		points = 0;
	}

	if(totalTurns == maxTurns && win == false)
	{
		alert("Empate!");
		document.location.reload(true);
	}
}