<?php
    require 'database.php';
    session_start();

    $codusuario = $_SESSION["codusuario"];
    $username = $_SESSION["username"];
    $tabsize = (isset($_POST['tabsize'])) ? $_POST['tabsize'] : 'vazio';
    $tablinhas = explode('x', $tabsize)[0];
    $tabcolunas = explode('x', $tabsize)[1];
    $numBombs = (isset($_POST['numBombs'])) ? $_POST['numBombs'] : 'vazio';
    $gameMode = (isset($_POST['gameMode'])) ? $_POST['gameMode'] : 'vazio';
    $playedTime = (isset($_POST['playedTime'])) ? $_POST['playedTime'] : 'vazio';
    $datetime = (isset($_POST['datetime'])) ? $_POST['datetime'] : 'vazio';
    $status = (isset($_POST['status'])) ? $_POST['status'] : 'vazio';

    if(isset($_POST['tabsize']))
    {
        // Gravar partida
        $db = new Database();
        $sql_gamematch = DBCommands::INSERT_INTO_GAMEMATCH($codusuario, $tablinhas, $tabcolunas, $numBombs, $gameMode, $playedTime, $status, $datetime);
        $db->executeCommand($sql_gamematch);
        $db->close();
    }

    $result = [
        'username'    =>  $username,
        'tabsize'     =>  $tabsize,
        'numBombs'    =>  $numBombs,
        'gameMode'    =>  $gameMode,
        'playedTime'  =>  $playedTime,
        'datetime'    =>  $datetime,
        'status'      =>  $status
    ];
    echo json_encode($result);
?>