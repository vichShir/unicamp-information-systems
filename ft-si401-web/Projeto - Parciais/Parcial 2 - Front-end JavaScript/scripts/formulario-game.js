/**
 * Gerenciador do formulário
 */

"use strict";

/**
 * Classe responsável por controlar as opções do game:
 * - Define e retorna tamanho do tabuleiro (linhas e colunas)
 * - Define e retorna número de bombas
 * - Define e retorna modo do game
 * */
class GameSettings
{
	constructor ()
	{
		this._tabSizeArr = new Array();
		this._numBombs = 0;
		this._gameMode = "classic";
	}

	/* SETTERS */
	set setTabSize(tabSize)
	{
		this._tabSizeArr = tabSize;
	}

	set setNumBombs(numBombs)
	{
		this._numBombs = numBombs;
	}

	set setGameMode(gameMode)
	{
		this._gameMode = gameMode;
	}

	/* GETTERS */
	get getTabSize()
	{
		return this._tabSizeArr;
	}

	get getTabRows()
	{
		return this.getTabSize[0];
	}

	get getTabColumns()
	{
		return this.getTabSize[1];
	}

	get getNumBombs()
	{
		return this._numBombs;
	}

	get getGameMode()
	{
		return this._gameMode;
	}
}

/**
 * Classe responsável por controlar os detalhes do formulário:
 * - Criar um GameSettings (herança)
 * - Estabelecer a conexão com os elementos do formulário
 * - Coletar os dados do selection para TabSize, NumBombs e GameMode
 * - Atualizar os dados do formulário
 * */
class GameForm extends GameSettings
{
	constructor (formName)
	{
		super();
		this._myForm = document.forms[formName];
		this._selectionTabSize = this._myForm["tabsize"];
		this._selectionNumBombs = this._myForm["qtdbombs"];
		this._selectionGameMode = this._myForm["mode"];
	}

	
	/*|*******************************|*/
  	/*|        Coleta de dados        |*/
  	/*|*******************************|*/
	#defineTabSize()
	{
		// Valor do selection
	    var tabsize = this.#getValueFromSelection(this._selectionTabSize);
	    // Convertendo e dividindo string em valores
	    var linhas = parseInt(tabsize.split("x")[0]);
	    var colunas = parseInt(tabsize.split("x")[1]);
	    // Definindo array com os valores de linhas e colunas
	    this.setTabSize = [linhas, colunas];
	}

	#defineNumBombs()
	{
	    var qtdbombsValue = this.#getValueFromSelection(this._selectionNumBombs);
		this.setNumBombs = parseInt(qtdbombsValue);
	}

	#defineGameMode()
	{
	    var qtdbombsValue = this.#getValueFromSelection(this._selectionGameMode);
		this.setGameMode = qtdbombsValue;
	}

	#getValueFromSelection(selection)
	{
		// Retornar o valor do selection
	    return selection[selection.selectedIndex].value;
	}

	/*|*******************************|*/
  	/*| Atualização dados formulário  |*/
  	/*|*******************************|*/
	updateGameSettings()
	{
		this.#defineTabSize();
		this.#defineNumBombs();
		this.#defineGameMode();
	}

	static updateBombsOptions(linhas, colunas)
	{
	    var selectBombs = document.getElementById("select-bombas");
	    var tamanhoTabuleiro = linhas * colunas;
	    var conteudo_select = ""; 
	    // Redefinir os conteúdo de bombas
	    selectBombs.innerHTML = "";
	    // Definir as opções
	    switch(tamanhoTabuleiro)
	    {
	    	case 25:
	    		conteudo_select = this.#gerarOpcoesBombas([3]);
	    		break;
	    	case 30:
	    		conteudo_select = this.#gerarOpcoesBombas([4]);
	    		break;
	    	case 36:
	    		conteudo_select = this.#gerarOpcoesBombas([6, 8]);
	    		break;
	    	case 49:
	    		conteudo_select = this.#gerarOpcoesBombas([8, 10]);
	    		break;
	    	case 64:
	    		conteudo_select = this.#gerarOpcoesBombas([10, 12]);
	    		break;
	    	case 81:
	    		conteudo_select = this.#gerarOpcoesBombas([12, 14]);
	    		break;
	    	case 100:
	    		conteudo_select = this.#gerarOpcoesBombas([14, 16]);
	    		break;
	    	default:
	    		conteudo_select = this.#gerarOpcoesBombas([30]);
	    }
	    // Atualizar o conteúdo (opções) de bombas
	    selectBombs.innerHTML = conteudo_select;
	}

	static #gerarOpcoesBombas(listaValores)
	{
	    var htmlOptions = "";
	    for (var i = 0; i < listaValores.length; i++)
	    {
	        htmlOptions += "<option value='" + listaValores[i] + "'>" + listaValores[i] + "</option>";
	    }
	    return htmlOptions;
	}
}