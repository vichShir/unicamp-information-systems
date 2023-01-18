<?php
    require('resources/php/session.php');
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <title>Campo Minado Online - Ranking Global</title>
    <link href="resources/css/main-style.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/footer-style.css" rel="stylesheet" type="text/css" />
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

    <!-- Painel com os rankings -->
    <section class="sec-panel">
        <h2>Ranking Global</h2>
        <hr>

        <?php
            require "resources/php/database.php";
            try
            {
                $db = new Database();
                $result = $db->getAllRowsFromQuery(DBCommands::GET_ALL_GAMEMATCHS());
                $db->close();

                $partidas = sort_ranking($result);
                $rank_pos = 0;
                $coroa = "";
                if(!empty($partidas))
                {
                    foreach($partidas as $partida)
                    {
                        $username = $partida["username"];
                        $rank_pos++;
                        if($rank_pos === 1) $coroa = "<img src='images/icons/crown_1_byFreepik.png' alt='coroa-dourada'>";
                        else if($rank_pos === 2) $coroa = "<img src='images/icons/crown_2_byFreepik.png' alt='coroa-prata'>";
                        else if($rank_pos === 3) $coroa = "<img src='images/icons/crown_3_byFreepik.png' alt='coroa-bronze'>";
                        else $coroa = "";
                        $tabsize = $partida["tablinhas"] . "x" . $partida["tabcolunas"];
                        $tempojogado = $partida["tempojogado"];

                        print_ranking($username, $coroa, $rank_pos, $tabsize, $tempojogado);
                    }
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

            function print_ranking($username, $coroa_img, $rank_pos, $tabsize, $tempojogado)
            {
                echo "<!-- Conteudo Ranking -->
                    <section class='sec-rk'>
                        <!-- Player Name -->
                        <h4 class='to-left'>" . $username . "</h4>
                        <!-- Player Rank -->
                        <div class='side-two to-right'>"
                           . $coroa_img . "<p>Rank " . $rank_pos . "</p>
                        </div>
                        <!-- TabSize -->
                        <div class='side-two to-left'>
                            <img src='images/icons/square-matrix.png' alt='tamanho-tabuleiro'>
                            <p>" . $tabsize . "</p>
                        </div>
                        <!-- Time-Played -->
                        <div class='side-two to-right'>
                            <img src='images/icons/clock.png' alt='tempo-jogado'>
                            <p>" . $tempojogado . "</p>
                        </div>
                    </section>
                    <hr class='rk-line'>";
            }

            function sort_ranking($unsort_ranking)
            {
                if(empty($unsort_ranking)) return;

                // Obtain a list of columns
                foreach ($unsort_ranking as $key => $row)
                {
                    $username[$key] = $row['username'];
                    $tablinhas[$key]  = $row['tablinhas'];
                    $tabcolunas[$key] = $row['tabcolunas'];
                    $tempojogado[$key] = $row['tempojogado'];
                }

                // Ordena os dados por tablinhas decrescente, tabcolunas decrescente e tempojogado crescente.
                // Adiciona $unsort_ranking como último parâmetro, para ordenar por uma chave comum.
                array_multisort($tablinhas, SORT_DESC, $tabcolunas, SORT_DESC, $tempojogado, SORT_ASC, $username, $unsort_ranking);

                $partidas = array();
                $rank_size = (sizeof($tablinhas) < 10) ? sizeof($tablinhas) : 10;
                for($i = 0; $i < $rank_size; $i++)
                {
                    $partidas[$i] = array();
                    $partidas[$i]['username'] = $username[$i];
                    $partidas[$i]['tablinhas'] = $tablinhas[$i];
                    $partidas[$i]['tabcolunas'] = $tabcolunas[$i];
                    $partidas[$i]['tempojogado'] = $tempojogado[$i];
                }

                return $partidas;
            }
        ?>

        <a class="button" href="game.php">Voltar</a>
        
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