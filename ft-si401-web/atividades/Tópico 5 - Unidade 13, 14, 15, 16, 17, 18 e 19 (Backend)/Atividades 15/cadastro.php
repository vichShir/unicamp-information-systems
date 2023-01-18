<!DOCTYPE html >
<html lang="pt">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <title>Alunos - Unidade 15</title>
</head>
<body>
      
    <div>
        <header>
            <h2>Menu</h2>
            <ul>
                <li><a href="exs15_cadastro.html">Cadastro</a></li>
                <li><a href="#">Alunos</a></li>
            </ul>
        </header>

        <section class="sec-registros">
            <h1>Alunos Cadastrados</h1>

        <?php

            /**** Todas as funções para cadastrar e exibir ****/
            include 'cadastro_funcs.php';

            /**** Cadastro do Aluno ****/
            // Verificar se houve um POST
            if (isset($_POST["firstName"]))
            {
                // Array do aluno a ser cadastrado (POST)
                $novoAluno = array();

                // Preenchendo o array do novo aluno
                array_push($novoAluno, $_POST["firstName"]);
                array_push($novoAluno, $_POST["ra"]);
                array_push($novoAluno, $_POST["sexo"]);
                array_push($novoAluno, $_POST["age"]);
                array_push($novoAluno, $_POST["address"]);
                array_push($novoAluno, $_POST["phone"]);
                array_push($novoAluno, $_POST["email"]);

                // Gravar aluno em arquivo
                gravar_aluno($novoAluno);
            }

            /**** Consultar os cadastros ****/
            // Array com todos os alunos cadastrados
            $alunos = array();

            // Ler o arquivo com os alunos cadastrados
            $alunos = ler_alunos();

            // Veriricar se o arquivo foi encontrado em ler_alunos()
            if($alunos <> -1)
            {
                // Ordernar os alunos pelo RA
                $RA_pos = 1;
                $alunos = sort_by_ra($alunos, $RA_pos);

                // Imprimir os registros dos alunos
                echo "<p>Total de alunos: " . sizeof($alunos) . "</p>";
                foreach ($alunos as $value) 
                {
                    echo "<section>";
                    echo "<h2>Dados do Aluno " . $value[0] . ":</h2>";
                    echo "<p>RA: " . $value[1] . "</p>";
                    echo "<p>Sexo: " . $value[2] . "</p>";     
                    echo "<p>Idade: " . $value[3] . "</p>";         
                    echo "<p>Endereço: " . $value[4] . "</p>";              
                    echo "<p>Telefone: " . $value[5] . "</p>";                
                    echo "<p>Email: " . $value[6] . "</p>";
                    echo "</section>";
                    echo "<br>";
                    echo "<br>";
                } 
            }
            else
            {
                echo "<p>Nenhum aluno cadastrado.</p>";
                echo "<p>Faça seu cadastro em Cadastro no Menu.</p>";
            } 
        ?>
        </section>

    </div>

    <footer>by Victor Yukio Shirasuna - FT Unicamp 2021</footer>

</body>
</html>
