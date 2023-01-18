/**
 * Classes do game
 */

"use strict";

/**
 * Classe responsável por controlar os detalhes do tabuleiro:
 * - Montar o tabuleiro no HTML
 * - Criar uma matrix de controle
 * - Gerar bombas aleatoriamente na matrix
 * - Gerar o número de bombas na vizinhança na matrix
 * - Contar o número de células abertas
 * - Calcular a pontuação final baseada em pesos
 * - Mostrar as células vazias da matriz recursivamente
 * - Mostrar as bombas da matriz
 * */
class Tabuleiro
{
    constructor(tableName, linhas, colunas)
    {
        this._tabela = document.getElementById(tableName);
        this._matrix;
        this._linhas = linhas;
        this._colunas = colunas;
        this.#assembleTable();
    }

    /*|*******************************|*/
    /*|        Tabela & Matrix        |*/
    /*|*******************************|*/
    #assembleTable()
    {
        this.#createMatrix();
        let conteudo_tabela = "";
        for (let linha = 0; linha < this._linhas; linha++)
        {
            conteudo_tabela += "<tr>";
            for (let coluna = 0; coluna < this._colunas; coluna++)
            {
                conteudo_tabela += "<td class='fechada'></td>";
            }
            conteudo_tabela += "</tr>";
        }
        this._tabela.innerHTML = conteudo_tabela;
    }

    #createMatrix()
    {
        this._matrix = new Array(this._linhas);
        let i = 0;
        while (i < this._matrix.length)
        {
            this._matrix[i] = new Array(this._colunas).fill(0);
            i++;
        }
    }

    /*|*******************************|*/
    /*|  Geração aleatória de bombas  |*/
    /*|*******************************|*/
    _genBombs(numBombs)
    {
        let b = 0; 
        while (b < numBombs)
        {
            let linha = this.#genRandomRow();
            let coluna = this.#genRandomColumn();
            if (this._matrix[linha][coluna] === 0) 
            {
                this._matrix[linha][coluna] = -1;
                b++;
            }
        }
    }

    #genRandomRow()
    {
        return Math.floor(Math.random() * this._linhas);
    }

    #genRandomColumn()
    {
        return Math.floor(Math.random() * this._colunas);
    }

    /*|*******************************|*/
    /*|   Número de bombas vizinhas   |*/
    /*|*******************************|*/
    _genNumbers()
    {
        for (let i = 0; i < this._linhas; i++) 
        {
            for (let j = 0; j < this._colunas; j++) 
            {
                if (this._matrix[i][j] !== -1) 
                {
                    this.#genNumber(i, j);
                }
            }
        }
    }

    #genNumber(linha, coluna)
    {
        let count = 0;
        for (let i = linha - 1; i <= linha + 1; i++) 
        {
            for (let j = coluna - 1; j <= coluna + 1; j++) 
            {
                if (i >= 0 && i < this._linhas && j >= 0 && j < this._colunas) 
                {
                    if (this._matrix[i][j] === -1) 
                    {
                        count++;
                    }
                }
            }
        }
        this._matrix[linha][coluna] = count;
    }

    /*|*******************************|*/
    /*|  Contagem de Células abertas  |*/
    /*|*******************************|*/
    get openCells()
    {
      let _opencells = 0;

      for(let i = 0; i < this._linhas; i++)
      {
        for(let j = 0; j < this._colunas; j++)
        {
          if (this._tabela.rows[i].cells[j].className !== "fechada")
          {
            if(this._matrix[i][j] !== -1)
            {
              // Número de células abertas
              _opencells += 1;
            }
          }
        }
      }

      return _opencells;
    }

    /*|*******************************|*/
    /*|           Pontuação           |*/
    /*|*******************************|*/
    get pScore()
    {
      let _cleanCells = 0;
      let _nBombCells = 0;

      for(let i = 0; i < this._linhas; i++)
      {
        for(let j = 0; j < this._colunas; j++)
        {
          if (this._tabela.rows[i].cells[j].className !== "fechada")
          {
            if(this._matrix[i][j] !== -1)
            {
              // Contagem de células vazias e células com bomba na vizinhança
              if(this._matrix[i][j] === 0)
                _cleanCells += 1;
              else
                _nBombCells += 1;
            }
          }
        }
      }
      // Pontuação baseada em pesos
      return (_cleanCells * 100) + (_nBombCells * 50);
    }

    /*|*******************************|*/
    /*|     Limpar celulas vazias     |*/
    /*|*******************************|*/
    _cleanCells(linha, coluna)
    {
      for (let i = linha - 1; i <= linha + 1; i++) 
      {
        for (let j = coluna - 1; j <= coluna + 1; j++) 
        {
          if (i >= 0 && i < this._linhas && j >= 0 && j < this._colunas) 
          {
            let cell = this._tabela.rows[i].cells[j];
            if (cell.className !== "vazia")
            {
              if(this._matrix[i][j] > 0) // Celula com bomba na vizinhança (parar)
              {
                cell.innerHTML = this._matrix[i][j];
                cell.className = "c-" + this._matrix[i][j];
              }
              else // Celula vazia (continuar)
              {
                cell.innerHTML = "";
                cell.className = "vazia";
                this._cleanCells(i, j);
              }
            }
          }
        }
      }
    }

    /*|*******************************|*/
    /*|     Mostrar bombas no HTML    |*/
    /*|*******************************|*/
    _showBombs()
    {
      // Mostrar apenas quando o jogo terminar
      if(this.isGameOver) return;

      for(let i = 0; i < this._linhas; i++)
      {
        for(let j = 0; j < this._colunas; j++)
        {
          if (this._matrix[i][j] === -1)
          {
            let cell = this._tabela.rows[i].cells[j];
            // Colocar simbolo de bomba
            cell.innerHTML = "&#128163";
            // Remover marcador de celula fechada
            cell.className = "";
          }
        }
      }
    }
}

/**
 * Classe responsável por controlar os detalhes do game (campo minado):
 * - Criar um tabuleiro (herança)
 * - Definir as configurações iniciais
 * - Configurar modo de jogo (stopwatch & timer)
 * - Verificar ações do player
 * - Atualizar as pontuações do player
 * - Verificar fim de jogo (derrota ou vitoria)
 * - Ativar e desativar trapaça
 * */
class CampoMinado extends Tabuleiro
{
    constructor(tableName, linhas, colunas, qtdBombas, gameMode)
    {
        super(tableName, linhas, colunas); // Constructor do tabuleiro
        this._numBombs = qtdBombas; // Número de bombas
        this._gameMode = gameMode; // Modo de jogo
        this._maxOpenCells; // Número máximo de células abertas
        this._pscore = 0; // Pontuação
        this._victory = 0; // 0: derrota ou 1: vitória
        this.isGameOver = false;
    }

    init()
    {
        this.#updatePlayerScores();
        this.#configureGameTime();
        this._genBombs(this._numBombs);
        this._genNumbers();
    }

    /*|*******************************|*/
    /*| Configuracao do Campo Minado  |*/
    /*|*******************************|*/
    #configureGameTime()
    {
        /**** Game Time Settings ****/
        if(this._gameMode === "rivotril")
        {
            /* Modo Rivotril (Stopwatch & Timer) */
            this.#configureRivotril();
        }
        else
        {
            /* Modo Clássico (Stopwatch) */
            this.#configureClassic();
        }
        // Mostrar o painel de Game Info
        GameInfo.showGameInfo();
    }

    #configureRivotril()
    {
      // Mostrar Timer em Game Info
      GameInfo.showTimerDiv();
      GameInfo.showStopwatchDiv();

      // Definir tempo do temporizador em s
      var initTime = this.#defineTimeForRivotril();

      // Inicia Stopwatch e Timer
      StopWatch.start("stopwatch");
      Timer.start("timer", initTime);
      Timer.execOnFinish(this);
    }

    #configureClassic()
    {
      // Esconder Timer de Game Info
      GameInfo.showStopwatchDiv();
      GameInfo.hideTimerDiv();

      // Inicia Stopwatch
      StopWatch.start("stopwatch");
    }

    #defineTimeForRivotril()
    {
        var tamanhoTabuleiro = this._linhas * this._colunas;
        var time;
        switch(tamanhoTabuleiro)
        {
            case 25:
                time = 180; // 3min
                break;
            case 30:
                time = 300; // 5min
                break;
            case 36:
                time = 600; // 10min
                break;
            case 49:
                time = 900; // 15min
                break;
            case 64:
                time = 1200; // 20min
                break;
            case 81:
                time = 1500; // 25min
                break;
            case 100:
                time = 1800; // 30min
                break;
            default:
                time = 2700; // 45min
        }
        return time;
    }

    // Implementação de callback do Timer
    callback()
    {
      this.#gameOver();
    }

    /*|*******************************|*/
    /*| Verificacao da acao do player |*/
    /*|*******************************|*/
    set setTableOnClick(onClickFunc)
    {
        this._tabela.onclick = onClickFunc;
    }

    verifyCell(linha, coluna)
    {
      try
      {
        var cell = this._tabela.rows[linha].cells[coluna];
        if(this._matrix[linha][coluna] === -1) // Game Over (perdeu)  
        {
          this.#gameOver();
          cell.className = "red-alert";
        }
        else if(this._matrix[linha][coluna] === 0) // Limpar celulas vazias recursivamente
        {
          this._cleanCells(linha, coluna);
        }
        else // Exibir celula com bomba na vizinhança
        {
          cell.innerHTML = this._matrix[linha][coluna];
          cell.className = "";
        }
        this.#updatePlayerScores();
        //    TESTE VERICAR VENCEU:
        this.#checkVictory();
        //FIM TESTE VERIFICAR VENCEU
      }
      catch(e)
      {
        console.log("Célula não encontrada.");
      }
    }

    /*|*******************************|*/
    /*|  Pontuação e Células abertas  |*/
    /*|*******************************|*/
    #updatePlayerScores()
    {
      this._maxOpenCells = (this._linhas * this._colunas) - this._numBombs;
      this._pscore = this.pScore;

      /* Atualizar pontuações do player */
      GameInfo.setOpenCellsText(this.openCells, this._maxOpenCells);
      GameInfo.setPlayerScoreText = this._pscore;
    }

    /*|*******************************|*/
    /*|    Checar possivel vitoria    |*/
    /*|*******************************|*/
    #checkVictory()
    {
      if(this._maxOpenCells == this.openCells)
      {
        this.#gameWin();
      }
    }

    /*|*******************************|*/
    /*|           Game Over           |*/
    /*|*******************************|*/
    #gameOver()
    {
        StopWatch.stop();
        Timer.stop();

        // Play audio clip
        var audio = new Audio('sounds/explosao.mp3');
        audio.addEventListener('canplaythrough', function() {
        audio.play();
        });

        alert("Derrota!");
        this._victory = 0;
        this._showBombs();
        this.isGameOver = true;

        partida = new Partida(this);
        enviarDados(partida.tabsize, partida.numBombs, partida.gameMode, partida.playedTime, partida.date, partida.isVictory);
    }

    /*|*******************************|*/
    /*|           Game Win            |*/
    /*|*******************************|*/
    #gameWin()
    {
        StopWatch.stop();
        Timer.stop();

        alert("Vitória!");
        this._victory = 1;
        this._showBombs();
        this.isGameOver = true;

        partida = new Partida(this);
        enviarDados(partida.tabsize, partida.numBombs, partida.gameMode, partida.playedTime, partida.date, partida.isVictory);
    }

    /*|*******************************|*/
    /*|           Trapaça             |*/
    /*|*******************************|*/
    ativarTrapaca()
    {
      for(var i = 0; i < this._linhas; i++)
      {
        for(var j = 0; j < this._colunas; j++)
        {
          var cell = this._tabela.rows[i].cells[j];
          if (this._matrix[i][j] === -1)
          {
            cell.innerHTML = "&#128163";
          }
          if (this._matrix[i][j] > 0)
          {
            cell.innerHTML = this._matrix[i][j];
          }
        }
      }       
    }

    desativarTrapaca()
    {
      for(var k = 0; k < this._linhas; k++)
      {
        for(var l = 0; l < this._colunas; l++)
        {
          var cell = this._tabela.rows[k].cells[l];
          if(cell.className === "fechada")
          {
            if (this._matrix[k][l] === -1 || this._matrix[k][l] > 0)
            {
              cell.innerHTML = "";
            }
          }
        }
      }
    }  
}

class Partida
{
    constructor(game)
    {
        this._campominado = game;
    }

    get tabsize()
    {
        let linhas = this._campominado._linhas;
        let colunas = this._campominado._colunas;

        return linhas + "x" + colunas;
    }

    get numBombs()
    {
        return this._campominado._numBombs;
    }

    get gameMode()
    {
        return this._campominado._gameMode[0].toUpperCase();
    }

    get playedTime()
    {
        let p_hours = StopWatch.finalHour;
        let p_minutes = StopWatch.finalMinute;
        let p_seconds = StopWatch.finalSecond;

        let hour_text = p_hours.toLocaleString('en-US', {
          minimumIntegerDigits: 2,
          useGrouping: false
        })
        let minute_text = p_minutes.toLocaleString('en-US', {
          minimumIntegerDigits: 2,
          useGrouping: false
        })
        let second_text = p_seconds.toLocaleString('en-US', {
          minimumIntegerDigits: 2,
          useGrouping: false
        })

        let textFormatted = "";
        textFormatted += p_hours > 0 ? hour_text + ":" : "00:";
        textFormatted += p_minutes > 0 ? minute_text + ":" : "00:";
        textFormatted += second_text;

        return textFormatted;
    }

    get date()
    {
        let timeElapsed = Date.now();
        let today = new Date(timeElapsed);

        let hours = today.getHours();
        let minutes = today.getMinutes();
        let seconds = today.getSeconds();

        return today.toISOString().split('T')[0] + " " + hours + ":" + minutes + ":" + seconds;
    }

    get isVictory()
    {
        return this._campominado._victory ? "V" : "D";
    }
}

/**
 * Classe responsável por controlar as informações da partida:
 * - Esconder e mostrar a seção do game-info
 * - Esconder e mostrar o Timer (Rivotril)
 * - Esconder e mostrar o Stopwatch (Classico & Rivotril)
 * - Definir o texto para a pontuação
 * - Definir o text para as células abertas
 * */
class GameInfo
{   
    static #SEC_INFO_NAME = "game-info";
    static #DIV_TIMER_NAME = "game-div-timer";
    static #DIV_STOPWATCH_NAME = "game-div-stopwatch";
    static #PLAYER_SCORE_NAME = "p-score";
    static #PLAYER_OPENCELLS_NAME = "p-opencells";

    static hideGameInfo()
    {
        var _gameInfoSection = document.getElementById(this.#SEC_INFO_NAME);
        _gameInfoSection.style.display = "none";
    }

    static showGameInfo()
    {
        var _gameInfoSection = document.getElementById(this.#SEC_INFO_NAME);
        _gameInfoSection.style.display = "block";
    }

    static hideTimerDiv()
    {
        var _timerDiv = document.getElementById(this.#DIV_TIMER_NAME);
        _timerDiv.style.display = "none";
    }

    static showTimerDiv()
    {
        var _timerDiv = document.getElementById(this.#DIV_TIMER_NAME);
        _timerDiv.style.display = "flex";
    }

    static hideStopwatchDiv()
    {
        var _stopwatchDiv = document.getElementById(this.#DIV_STOPWATCH_NAME);
        _stopwatchDiv.style.display = "none";
    }

    static showStopwatchDiv()
    {
        var _stopwatchDiv = document.getElementById(this.#DIV_STOPWATCH_NAME);
        _stopwatchDiv.style.display = "flex";
    }

    static set setPlayerScoreText(score)
    {
        var _pscoreText = document.getElementById(this.#PLAYER_SCORE_NAME);
        _pscoreText.innerHTML = "Pontuação: " + score;
    }

    static setOpenCellsText(numOpenCells, maxOpenCells)
    {
        var _opencellsText = document.getElementById(this.#PLAYER_OPENCELLS_NAME);
        _opencellsText.innerHTML = "Células abertas: " + numOpenCells + " de " + maxOpenCells;
    }
}