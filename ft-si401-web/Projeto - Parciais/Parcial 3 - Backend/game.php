<?php
    require('resources/php/session.php');
?>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <title>Campo Minado Online - Game</title>
    <link href="resources/css/main-style.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/game-style.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/footer-style.css" rel="stylesheet" type="text/css"/>
    <script src="resources/javascript/formulario-game.js"></script>
    <script src="resources/javascript/time.js"></script>
    <script src="resources/javascript/game.js"></script>
    <script src="resources/javascript/data-manager.js"></script>
    <script src="resources/javascript/game-manager.js"></script>
    <!-- Importando fontes Google -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/icons/iconweb-bomb.ico"/>
  </head>

  <body>

    <!-- Cabeçalho -->
    <header>
      <h1>Campo Minado Online</h1>
      <!-- Menu -->
      <?php require("resources/php/menu.php"); ?>
    </header>

    <!-- Painel do game (Game & Historico) -->
    <section class="sec-panel sec-game">

        <!-- Game -->
        <h2>Campo Minado</h2>
        <hr>

        <!-- Opções do Jogo -->
        <section class="game-settings">
          <h4>Escolha seu jogo:</h4>

          <!-- Formulário para definir Jogo -->
          <form name="formulario-jogo" onsubmit="return initGameButton()">
            <!-- Organizar as opções em linha -->
            <div class="form-options">
              <!-- TabSize -->
              <div>
                <img src="images/icons/square-matrix.png" alt="tamanho-tabuleiro">
                <select name="tabsize" onchange="updateBombsOptions();">
                  <option value="5x5">5x5</option>
                  <option value="5x6">5x6</option>
                  <option value="6x6">6x6</option>
                  <option value="7x7">7x7</option>
                  <option value="8x8">8x8</option>
                  <option value="9x9">9x9</option>
                  <option value="10x10">10x10</option>
                  <option value="15x15">15x15</option>
                </select>
              </div>
              <!-- Quantidade de Bombas -->
              <div>
                <img src="images/icons/round-bomb_byFreepik.png" alt="numero-bombas">
                <select id="select-bombas" name="qtdbombs">
                  <option value='3'>3</option>
                </select>
              </div>
              <!-- Modo Jogo -->
              <div>
                <img src="images/icons/rubik_byFreepik.png" alt="modo-jogo">
                <select name="mode">
                  <option value="classic">Clássico</option>
                  <option value="rivotril">Rivotril</option>
                </select>
              </div>
            </div>

            <!-- Botão para definir Jogo -->
            <input id="form-button" type="submit" value="Iniciar Jogo">
          </form>
        </section>

        <!-- Informações da Partida -->
        <section id="game-info">
          <h4>Partida:</h4>

          <!-- Tempos -->
          <div class="game-time">
            <!-- Tempo Jogado -->
            <div class="side-two" id="game-div-stopwatch">
              <img src="images/icons/clock.png" alt="tempo-decorrido">
              <p id="stopwatch">--.--.--</p>
            </div>

            <!-- Timer (Se for Modo Rivotril) -->
            <div class="side-two" id="game-div-timer">
              <img src="images/icons/timer_byFreepik.png" alt="timer">
              <p id="timer">--.--.--</p>
            </div>
          </div>

          <!-- Botão de Trapaça -->
          <div class="side-two active-trap" onclick="ativarTrapaca();">
            <img src="images/icons/target_bySmashicons.png" alt="trapaca">
            <p>Ativar Trapaça</p>
          </div>

          <!-- Pontuação do Player -->
          <p id="p-score">Pontuação: xx</p>
          <!-- Número de Células Abertas -->
          <p id="p-opencells">Células abertas: xx</p>
        </section>

        <!-- Implementar Tabuleiro Aqui -->
        <table id="tabela"></table>
        
        <!-- Historico Jogadores -->
        <h2>Histórico</h2>
        <hr>

        <div id="hist-partidas">
        <?php
            require "resources/php/database.php";
            try
            {
                $db = new Database();
                $result = $db->getAllRowsFromQuery(DBCommands::GET_ALL_GAMEMATCHS_FROM_USER($_SESSION["codusuario"]));
                $db->close();

                foreach(array_reverse($result) as $partida)
                {
                    $username = $_SESSION["username"];
                    $status = ($partida["status"] === "D") ? "DERROTA" : "VITÓRIA";
                    $date = new DateTime($partida["dtpartida"]);
                    $tabsize = $partida["tablinhas"] . "x" . $partida["tabcolunas"];
                    $numbombas = $partida["numbombas"];
                    $gamemode = ($partida["modo"] === "C") ? "Clássico" : "Rivotril";
                    $tempojogado = $partida["tempojogado"];

                    print_partida($username, $status, $date->format('d/m/Y H:i:s'), $tabsize, $numbombas, $gamemode, $tempojogado);
                }
            }
            catch(DatabaseConnectionException $e)
            {
                echo $e->errorMessage();
            }
            catch(DatabaseQueryException $e)
            {
                echo $e->errorMessage();
            }
            catch(PDOException $e)
            {
                echo $e->getMessage();
            }

            function print_partida($username, $status, $date, $tabsize, $numbombas, $gamemode, $tempojogado)
            {
              echo "<!-- Conteudo Partida -->
                    <div>
                    <section class='sec-hist'>
                    <!-- Primeira linha de conteudos(3) -->
                    <div class='hist-row'>
                    <!-- Player Name -->
                    <h4 class='to-left'>" . $username . "</h4>
                    <!-- Game Status -->
                    <h4 class='game-status'>" . $status . "</h4>
                    <!-- Played Date -->
                    <div class='side-two to-right'>
                        <img src='images/icons/calendar_byFreepik.png' alt='tamanho-tabuleiro'>
                        <p>" . $date . "</p>
                    </div>
                    </div>
                    <!-- Segunda linha de conteudos(4) -->
                    <div class='hist-row hist-row2'>
                    <!-- TabSize -->
                    <div class='side-two to-left'>
                        <img src='images/icons/square-matrix.png' alt='coroa-dourada'>
                        <p>" . $tabsize . "</p>
                    </div>
                    <!-- Quantidade de Bombas -->
                    <div class='side-two'>
                        <img src='images/icons/round-bomb_byFreepik.png' alt='numero-bombas'>
                        <p>" . $numbombas . "</p>
                        </div>
                    <!-- Game Mode -->
                    <div class='side-two'>
                        <img src='images/icons/rubik_byFreepik.png' alt='modo-jogo'>
                        <p>" . $gamemode . "</p>
                        </div>
                    <!-- Time Played -->
                    <div class='side-two to-right'>
                        <img src='images/icons/clock.png' alt='tempo-jogado'>
                        <p>" . $tempojogado . "</p>
                    </div>
                    </div>
                </section>
                <hr class='hist-line'>
                </div>";
            }
        ?>
        </div>

    </section>

    <!-- Rodapé -->
    <footer>
        <!-- Rodapé principal -->
        <div class="ft-topics">
            <!-- About -->
            <section class="ft-about">
                <h3>SOBRE</h3>
                <p>Website do jogo Campo Minado desenvolvido na disciplina de Programação para a Web na FT - Unicamp.</p>
            </section>
            <!-- Devs -->
            <section class="ft-devs">
                <h3>DESENVOLVEDORES</h3>
                <ul>
                    <li>Caio Masseu</li>
                    <li>Jonatas Goes</li>
                    <li>Matheus Silva</li>
                    <li>Victor Shirasuna</li>
                </ul>
            </section>
        </div>
      
        <!-- Rodapé inferior -->
        <div class="ft-info">
            <p>SI401 - Programação Web 2021 - Grupo 8</p>
        </div>
    </footer>

  </body>
</html>
        