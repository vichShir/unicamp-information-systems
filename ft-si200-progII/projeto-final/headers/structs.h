#ifndef STRUCTS_H_INCLUDED
#define STRUCTS_H_INCLUDED

#define MAX_CHAR_SIZE 100
#define BUFFER_SIZE 3

typedef struct Cliente
{
    int id;
    int cpf;
    char *nome;
    char *endereco;
    char *email;
} Cliente;

typedef struct Produto
{
    int id;
    char *nome;
    char *categoria;
    int quantidade;
    float preco;
} Produto;

typedef struct Venda
{
    int id_comprador;
    char categoria[MAX_CHAR_SIZE];
    char nome[MAX_CHAR_SIZE];
    int quantidade;
    float lucro;
} Venda;

#endif // STRUCTS_H_INCLUDED
