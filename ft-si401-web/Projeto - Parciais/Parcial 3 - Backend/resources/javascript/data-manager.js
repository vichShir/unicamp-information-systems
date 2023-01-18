/**
 * Gerenciador de dados do game
 */

"use strict";

let xhttp;

function enviarDados(tabsize, numBombs, gameMode, playedTime, datetime, status)
{
    xhttp = new XMLHttpRequest();
    
    if (!xhttp) 
    {
        alert('Não foi possível criar um objeto XMLHttpRequest.');
        return false;
    }
    xhttp.onreadystatechange = mostraResposta;
    xhttp.open('POST', 'resources/php/salvar_partida.php', true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('tabsize=' + encodeURIComponent(tabsize) + 
        '&numBombs=' + encodeURIComponent(numBombs) +
        '&gameMode=' + encodeURIComponent(gameMode) +
        '&playedTime=' + encodeURIComponent(playedTime) +
        '&datetime=' + encodeURIComponent(datetime) +
        '&status=' + encodeURIComponent(status));
}

function mostraResposta() 
{
    try
    {
        if (xhttp.readyState === XMLHttpRequest.DONE)
        {
            if (xhttp.status === 200)
            {
                let resposta = JSON.parse(xhttp.responseText);

                let username = resposta.username;
                let status = resposta.status === "D" ? "DERROTA" : "VITÓRIA";
                let date = getDatetimeText(resposta.datetime);
                let tabsize = resposta.tabsize;
                let numBombs = resposta.numBombs;
                let gamemode = resposta.gameMode === "C" ? "Clássico" : "Rivotril";
                let playedTime = resposta.playedTime;
                let conteudo = getConteudoHistorico(username, status, date, tabsize, numBombs, gamemode, playedTime);

                insertFirst(conteudo);
            }
            else
            {
                alert('Um problema ocorreu.');
            }
        }
    } 
    catch (e)
    {
        alert("Ocorreu uma exceção: " + e.description);
    }
}

function getConteudoHistorico(username, status, date, tabsize, numBombs, gamemode, playedTime)
{
    return "<!-- Conteudo Partida -->\
                    <section class='sec-hist'>\
                    <!-- Primeira linha de conteudos(3) -->\
                    <div class='hist-row'>\
                    <!-- Player Name -->\
                    <h4 class='to-left'>" + username + "</h4>\
                    <!-- Game Status -->\
                    <h4 class='game-status'>" + status + "</h4>\
                    <!-- Played Date -->\
                    <div class='side-two to-right'>\
                        <img src='images/icons/calendar_byFreepik.png' alt='tamanho-tabuleiro'>\
                        <p>" + date + "</p>\
                    </div>\
                    </div>\
                    <!-- Segunda linha de conteudos(4) -->\
                    <div class='hist-row hist-row2'>\
                    <!-- TabSize -->\
                    <div class='side-two to-left'>\
                        <img src='images/icons/square-matrix.png' alt='coroa-dourada'>\
                        <p>" + tabsize + "</p>\
                    </div>\
                    <!-- Quantidade de Bombas -->\
                    <div class='side-two'>\
                        <img src='images/icons/round-bomb_byFreepik.png' alt='numero-bombas'>\
                        <p>" + numBombs + "</p>\
                        </div>\
                    <!-- Game Mode -->\
                    <div class='side-two'>\
                        <img src='images/icons/rubik_byFreepik.png' alt='modo-jogo'>\
                        <p>" + gamemode + "</p>\
                        </div>\
                    <!-- Time Played -->\
                    <div class='side-two to-right'>\
                        <img src='images/icons/clock.png' alt='tempo-jogado'>\
                        <p>" + playedTime + "</p>\
                    </div>\
                    </div>\
                </section>\
                <hr class='hist-line'>";
}

function getDatetimeText(datetime)
{
    let today = new Date(datetime);
    let hours = today.getHours();
    let minutes = today.getMinutes();
    let seconds = today.getSeconds();

    let hour_text = hours.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
    let minute_text = minutes.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
    let second_text = seconds.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })

    return today.toLocaleDateString() + " " + hour_text + ":" + minute_text + ":" + second_text;
}

function insertFirst(conteudo)
{
    let partidas = document.getElementById("hist-partidas");
    let newPartida = document.createElement('div');
    let firstPartidaChild = partidas.getElementsByTagName('div')[0];
    newPartida.innerHTML = conteudo;
    partidas.insertBefore(newPartida, firstPartidaChild);
}