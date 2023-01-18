<?php 

	/**
     * Função para adicionar o aluno em disco:
     * 1. Serializa o array do aluno
     * 2. Adiciona a serialização a uma nova linha do arquivo
     */
    function gravar_aluno($aluno)
    {
        $aluno = serialize($aluno);
        file_put_contents("alunos.txt", $aluno . PHP_EOL, FILE_APPEND);
    }

    /**
     * Função para ler os dados dos alunos cadastrados:
     * 1. Lê todo o arquivo
     * 2. Cria um array de cada linha
     * 3. Desserializa cada linha do arquivo
     * 4. Adiciona o registro do aluno a um array dos alunos
     * 5. Retorna o array com todos os alunos
     */
    function ler_alunos()
    {
    	if (!file_exists("alunos.txt"))
    		return -1;

        $arquivo = file_get_contents("alunos.txt");
        $linhas = explode(PHP_EOL, $arquivo);
        $alunos = array();

        foreach ($linhas as $registro) 
        {
            $aluno = unserialize($registro);
            array_push($alunos, $aluno);
        }

        return $alunos;
    }

    /**
     * Função para ordernar uma lista de acordo com o $sort_index da lista de dentro:
     * 1. Cria um novo array com apenas os numeros
     * 2. Ordena esse array com os numeros
     * 3. Associa o array com os numeros ordenados com a lista antiga
     * 4. Retorna a lista ordenada
     */
    function sort_by_ra($lista, $sort_index)
    {
        $lista_ordenada = array();
        $todos_ra = array();

        // Extrai os elementos da lista (pelo $sort_index) e adiciona a $todos_ra
        for($i = 0; $i < sizeof($lista)-1; $i++)
        {
            array_push($todos_ra, $lista[$i][$sort_index]);
        }

        // Ordena os numeros em ordem crescente
        asort($todos_ra);

        // Adiciona os elementos ordenados em uma nova lista
        foreach ($todos_ra as $index=>$ra)
        {
            array_push($lista_ordenada, $lista[$index]);
        }

        // Retorna a lista ordenada
        return $lista_ordenada;
    }

?>