<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<title>Tabuleiro de Xadrez</title>
</head>
<body>
	<h1>Unidades 13 e 14 - PHP</h1>
	<h3>1) Tabuleiro de Xadrez</h3>

   	<?php
   		/* 1) Tabuleiro de Xadrez */
   		function swap_color(&$color)
   		{
   			if ($color == "white")
   				$color = "black";
   			else
   				$color = "white";
   		}

   		$color = "white";
		echo "<table>";
		for ($i = 0; $i < 9; $i++)
		{
			echo "<tr>";

			for ($j = 0; $j < 9; $j++)
			{
				echo "<th class='$color'></th>";
				swap_color($color);
			}

			echo "</tr>";
		}
		echo "</table>";
		echo "<br>";

		/* 2) Strings de um vetor em maiusculo */
		$Cor = array('A'=>'Azul', 'B'=>'Verde', 'c'=>'Vermelho');

		function to_upper(&$vetor)
		{
			$texto = "";

			foreach($vetor as $key => $value)  
			{  
				$value = strtoupper($value);
	 			$texto .= "[$key] => $value ";
			}

			return $texto;
		}

		$vetorUpper = to_upper($Cor);
		echo "<h3>2) Strings de um vetor em maiusculo</h3>";
		echo "<p>$vetorUpper</p>";
		echo "<br>";

		/* 3) Imprimir o menor e o maior tamanho de strings em um vetor */
		$textos = array("abcd","abc","de", "hjjj", "g", "wer");
		$tam_textos = array();

		foreach ($textos as $key => $value) 
		{
			array_push($tam_textos, strlen($value));
		}

		$max_tam_texto = max($tam_textos);
		$min_tam_texto = min($tam_textos);

		echo "<h3>3) Imprimir o menor e o maior tamanho de strings em um vetor</h3>";
		echo "<p>O menor comprimento é $min_tam_texto.</p>";
		echo "<p>O maior comprimento é $max_tam_texto.</p>";
	?>

	<footer>by Victor Yukio Shirasuna - FT Unicamp 2021</footer>
</body>
</html>