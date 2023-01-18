<?php
    require('resources/php/session.php');
    require('resources/php/database.php');

    if(isset($_POST["name"]))
    {
        try
        {
            $id = $_SESSION["codusuario"];
            $nome = $_POST["name"];
            $telefone = $_POST["phone"];
            $email = $_POST["email"];
            $password = $_POST["pwd"];
            $confirm_password = $_POST["confirm-pwd"];

            if($password !== $confirm_password)
            {
                throw new Exception("As duas senhas são diferentes.");
            }

            $db = new Database();
            $sql_update = DBCommands::UPDATE_USER($id, $nome, $telefone, $email, $password);
            $db->executeCommand($sql_update);
            $db->close();
            $message = "Dados atualizados com sucesso!";
        }
        catch(DatabaseConnectionException $e)
        {
            $message = "Banco de dados inoperante. Fale com o administrador do site.";
        }
        catch(DatabaseExecuteException $e)
        {
            $message = "Não foi possível atualizar seus dados.<br>Tente novamente.";
        }
        catch(Exception $e)
        {
            $message = "Ocorreu um erro: " . $e->getMessage();
        }
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <title>Campo Minado Online - Editar Perfil</title>
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
    <header>
      <h1>Campo Minado Online</h1>
      <!-- Menu -->
      <?php require("resources/php/menu.php"); ?>
    </header>

    <!-- Formulário de Editar Cadastro -->
    <section class="sec-panel sec-form">
        <h2>Editar Cadastro</h2>
        <hr>
        <form name="formulario-edit" action="edit-profile.php" method="POST">
            <p class="form-input">Nome Completo</p>
            <input type="text" name="name" placeholder="Insira seu nome completo" size="40" maxlength="40" required>
            <p class="form-input">Telefone</p>
            <input type="tel" name="phone" placeholder="Exemplo: 00111112222" pattern="[0-9]{2}[0-9]{5}[0-9]{4}" size="11" maxlength="11" required>
            <p class="form-input">Email</p>
            <input type="email" name="email" placeholder="Exemplo: user@email.com" size="40" maxlength="40" required>
            <p class="form-input">Nova senha</p>
            <input type="password" name="pwd" placeholder="Insira sua nova senha" size="20" minlength="8" maxlength="20" required>
            <p class="form-input">Confirme sua nova senha</p>
            <input type="password" name="confirm-pwd" placeholder="Digite novamente sua nova senha" size="20"  minlength="8" maxlength="20" required>

            <!-- atributo onclick é temporário p/ esta Parcial 1 -->
            <p><input id="form-button" type="submit" value="Editar"></p>
        </form>

        <!-- Link para voltar ao game -->
        <p><a href="game.php">Voltar</a></p>

        <div style = "font-size:12px; color:#FFF; margin-top:10px"><?php echo isset($message) ? $message : ""; ?></div>

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

