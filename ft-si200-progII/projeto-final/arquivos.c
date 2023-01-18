#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "headers/arquivos.h"

//===========================================================================
//=============================     Cliente     =============================
//===========================================================================
Cliente *allocCliente(int buffer)
{
    int _bufferLimit = buffer * BUFFER_SIZE;
    Cliente *clientes = (Cliente*) malloc(_bufferLimit * sizeof(Cliente));
    for(int i = 0; i < _bufferLimit; i++)
    {
        (clientes+i)->nome = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
        (clientes+i)->endereco = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
        (clientes+i)->email = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
    }
    return clientes;
}

Cliente *reallocCliente(Cliente *oldCliente, int n_registros, int buffer)
{
    int _bufferLimit = buffer * BUFFER_SIZE;
    Cliente *clientes = (Cliente*) realloc(oldCliente, _bufferLimit * sizeof(Cliente));
    for(int i = n_registros+1; i < _bufferLimit; i++)
    {
        (clientes+i)->nome = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
        (clientes+i)->endereco = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
        (clientes+i)->email = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
    }
    return clientes;
}

Cliente *lerArquivoClientes(int* n_registros, int* tam_buffer)
{
    FILE *arq = fopen(ARQUIVO_CLIENTES_PATH, "rb");
    if(arq != NULL)
    {
        // Leituras das variaveis de controle
        fread(n_registros, sizeof(int), 1, arq);
        fread(tam_buffer, sizeof(int), 1, arq);

        // Trazendo dados para memoria
        Cliente *clientes = allocCliente(*tam_buffer);
        for(int i = 0; i < *n_registros; i++)
        {
            fread(&(*(clientes+i)).id, sizeof(int), 1, arq);
            fread(&(*(clientes+i)).cpf, sizeof(int), 1, arq);
            fread((clientes+i)->nome, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fread((clientes+i)->endereco, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fread((clientes+i)->email, MAX_CHAR_SIZE * sizeof(char), 1, arq);
        }
        fclose(arq);
        return clientes;
    }
    else
    {
        fclose(arq);
        return allocCliente(*tam_buffer);
    }
}

// Funcao para gravar os dados das vendas no disco por escrita binaria e depois fechar o arq
void armazenarCliente(Cliente *clientes, int size, int tam_buffer)
{
    FILE *arq = fopen(ARQUIVO_CLIENTES_PATH, "wb");
    if (arq != NULL)
    {
        // Gravando dados
        fwrite(&size, sizeof(int), 1, arq);
        fwrite(&tam_buffer, sizeof(int), 1, arq);

        for(int i = 0; i < size; i++)
        {
            fwrite(&(*(clientes+i)).id, sizeof(int), 1, arq);
            fwrite(&(*(clientes+i)).cpf, sizeof(int), 1, arq);
            fwrite((clientes+i)->nome, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fwrite((clientes+i)->endereco, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fwrite((clientes+i)->email, MAX_CHAR_SIZE * sizeof(char), 1, arq);
        }
    }
    fclose(arq);
}

//===========================================================================
//=============================     Produto     =============================
//===========================================================================
Produto *allocProduto(int buffer)
{
    int _bufferLimit = buffer * BUFFER_SIZE;
    Produto *produtos = (Produto*) malloc(buffer * BUFFER_SIZE * sizeof(Produto));
    for(int i = 0; i < _bufferLimit; i++)
    {
        (produtos+i)->nome = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
        (produtos+i)->categoria = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
    }
    return produtos;
}

Produto *reallocProduto(Produto *oldProduto, int n_registros, int buffer)
{
    int _bufferLimit = buffer * BUFFER_SIZE;
    Produto *produtos = (Produto*) realloc(oldProduto, (buffer * BUFFER_SIZE * sizeof(Produto)));
    for(int i = n_registros+1; i < _bufferLimit; i++)
    {
        (produtos+i)->nome = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
        (produtos+i)->categoria = (char*) malloc(MAX_CHAR_SIZE * sizeof(char));
    }
    return produtos;
}

Produto *lerArquivoProdutos(int* n_registros, int* tam_buffer)
{
    FILE *arq = fopen(ARQUIVO_PRODUTOS_PATH, "rb");
    if(arq != NULL)
    {
        // Leituras das variaveis de controle
        fread(n_registros, sizeof(int), 1, arq);
        fread(tam_buffer, sizeof(int), 1, arq);

        // Trazendo dados para memoria
        Produto *produtos = allocProduto(*tam_buffer);
        for(int i = 0; i < *n_registros; i++)
        {
            fread(&(*(produtos+i)).id, sizeof(int), 1, arq);
            fread((produtos+i)->nome, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fread((produtos+i)->categoria, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fread(&(*(produtos+i)).quantidade, sizeof(int), 1, arq);
            fread(&(*(produtos+i)).preco, sizeof(float), 1, arq);
        }
        fclose(arq);
        return produtos;
    }
    else
    {
        fclose(arq);
        return allocProduto(*tam_buffer);
    }
}

// Funcao para gravar os dados das vendas no disco por escrita binaria e depois fechar o arq
void armazenarProduto(Produto *produtos, int size, int tam_buffer)
{
    FILE *arq = fopen(ARQUIVO_PRODUTOS_PATH, "wb");
    if (arq != NULL)
    {
        // Gravando dados
        fwrite(&size, sizeof(int), 1, arq);
        fwrite(&tam_buffer, sizeof(int), 1, arq);

        for(int i = 0; i < size; i++)
        {
            fwrite(&(*(produtos+i)).id, sizeof(int), 1, arq);
            fwrite((produtos+i)->nome, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fwrite((produtos+i)->categoria, MAX_CHAR_SIZE * sizeof(char), 1, arq);
            fwrite(&(*(produtos+i)).quantidade, sizeof(int), 1, arq);
            fwrite(&(*(produtos+i)).preco, sizeof(float), 1, arq);
        }
    }
    fclose(arq);
}

//===========================================================================
//=============================      Venda      =============================
//===========================================================================
Venda* allocVenda(int buffer)
{
    Venda* vendas;
    vendas = (Venda*) malloc(buffer * BUFFER_SIZE * sizeof(Venda));
    return vendas;
}

Venda *reallocVenda(Venda *oldVenda, int buffer)
{
    Venda *venda;
    venda = (Venda*) realloc(oldVenda, (buffer * BUFFER_SIZE * sizeof(Venda)));
    return venda;
}

Venda* lerArquivoVendas(int* n_registros, int* tam_buffer)
{
    FILE *arq = fopen(ARQUIVO_VENDAS_PATH, "rb");
    if(arq != NULL)
    {
        Venda* vendas;

        // Leituras das variaveis de controle
        fread(n_registros, sizeof(int), 1, arq);
        fread(tam_buffer, sizeof(int), 1, arq);

        // Trazendo dados para memoria
        vendas = allocVenda(*tam_buffer);
        fread(vendas, sizeof(Venda), *n_registros, arq);
        fclose(arq);

        return vendas;
    }
    else
    {
        fclose(arq);
        return allocVenda(*tam_buffer);
    }
}

// Funcao para gravar os dados das vendas no disco por escrita binaria e depois fechar o arq
void armazenarVenda(Venda *vendas, int size, int tam_buffer)
{
    FILE *arq = fopen(ARQUIVO_VENDAS_PATH, "wb");
    if (arq != NULL)
    {
        // Gravando dados
        fwrite(&size, sizeof(int), 1, arq);
        fwrite(&tam_buffer, sizeof(int), 1, arq);
        fwrite(vendas, sizeof(Venda), size, arq);
    }
    fclose(arq);
}