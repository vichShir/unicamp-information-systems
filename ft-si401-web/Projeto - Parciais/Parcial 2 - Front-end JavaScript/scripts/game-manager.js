/**
 * Gerenciador do game
 */

"use strict";

/* Variáveis do game */
var linhas, colunas, qtdbombs, gamemode;
var forms;
var game;
var isTrapaca;

/** 
 * Função inicializadora:
 * - Estabelece a conexão com o formulário do jogo
 * - Esconde as informações do jogo
 * */
function init()
{
  forms = new GameForm("formulario-jogo");
  updateBombsOptions();
  GameInfo.hideGameInfo();
}

/** 
 * Função para iniciar jogo:
 * - Atualiza as variáveis do game
 * - Cria um novo Campo Minado (classe em game.js)
 * - Configura o Campo Minado
 * */
function initGameButton()
{
  updateGameSettings();

  game = new CampoMinado("tabela", linhas, colunas, qtdbombs, gamemode);
  game.setTableOnClick = onClickCell;
  game.init();

  return false;
}

/** 
 * Função para atualizar as opções de bombas (chamada de name="tabsize" no html)
 * - Atualiza as variáveis do game
 * - Chama o metodo de GameForm para exibir as opções
 * */
function updateBombsOptions()
{
  updateGameSettings();
  GameForm.updateBombsOptions(linhas, colunas);
}

/** 
 * Função para atualizar as variáveis do game pelo Formulário:
 * - Atualiza os dados do formulário dentro de GameForm (formulario-game.js)
 * - Atualiza as variáveis do game
 * */
function updateGameSettings()
{
  forms.updateGameSettings();
  linhas = forms.getTabRows;
  colunas = forms.getTabColumns;
  qtdbombs = forms.getNumBombs;
  gamemode = forms.getGameMode;
}

/** 
 * Função de captar as ações do player no tabuleiro:
 * - Determina a ação da celula do tabuleiro
 * - Determina a linha e a coluna da celula
 * - Verifica a ação a ser determinada no método do game
 * */
function onClickCell(event)
{
  // Verificar celula se o jogo não terminou
  if(game.isGameOver) return;

  var cell = event.target;
  var linha = cell.parentNode.rowIndex;
  var coluna = cell.cellIndex;
  game.verifyCell(linha, coluna);
}

/** 
 * Função para ativar trapaça temporária:
 * - Chama método de ativar trapaça de CampoMinado
 * - Chama função de desativar trapaça depois de 5 segundos
 * */
function ativarTrapaca()
{
  // Ativar trapaca se o jogo não terminou
  if(game.isGameOver || isTrapaca) return;

  isTrapaca = true;
  game.ativarTrapaca(game);
  setTimeout(desativarTrapaca, 5*1000);
}

function desativarTrapaca()
{
  isTrapaca = false;
  game.desativarTrapaca();
}

// Chamar a função inicializadora ao carregar a página
onload = init;