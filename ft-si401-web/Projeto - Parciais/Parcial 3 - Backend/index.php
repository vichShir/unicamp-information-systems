<?php
    require "resources/php/login-session.php";
    require "resources/php/database.php";

    if(isset($_POST["username"]))
    {
        $username = $_POST["username"];
        $password = $_POST["pwd"];

        try
        {
            $db = new Database();
            $sql_login = DBCommands::GET_USER_LOGIN($username, $password);
            $result = $db->getRowFromQuery($sql_login);
            $db->close();

            $_SESSION["codusuario"] = $result["codusuario"];
            $_SESSION["username"] = $result["username"];
            header("Location:game.php");
            die;
        }
        catch(DatabaseConnectionException $e)
        {
            $error = "Banco de dados inoperante. Fale com o administrador do site.";
        }
        catch(DatabaseQueryException $e)
        {
            $error = "Usuário ou senha incorretos.<br>Faça seu cadastro ou tente novamente.";
        }
        catch(Exeception $e)
        {
            $error = "Ocorreu um erro inesperado. Contate um administrador ou tente novamente.";
        }
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <title>Campo Minado Online - Login</title>
    <link href="resources/css/main-style.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/form-style.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/footer-style.css" rel="stylesheet" type="text/css"/>
    <!-- Importando fontes Google -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/icons/iconweb-bomb.ico"/>
  </head>

  <body>

    <!-- Cabeçalho -->
    <header style="height: 90px"><h1>Campo Minado Online</h1></header>

    <!-- Formulário de Login -->
    <section class="sec-panel sec-form">
        <h2>Login</h2>
        <hr>
        <form name="formulario-login" action="index.php" method="POST">
            <p class="form-input"><input type="text" name="username" placeholder="Usuário" size="30" maxlength="30" required></p>
            <p class="form-input"><input type="password" name="pwd" placeholder="Senha" size="20"  minlength="8" maxlength="20" required></p>

            <!-- atributo onclick é temporário p/ esta Parcial 1 -->
            <p><input id="form-button" type="submit" value="Entrar" ></p>
        </form>

        <!-- Link para cadastro -->
        <p><a href="cadastro.php">Cadastrar</a></p>

        <div style = "font-size:12px; color:#cc0000; margin-top:10px"><?php echo isset($error) ? $error : ""; ?></div>

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