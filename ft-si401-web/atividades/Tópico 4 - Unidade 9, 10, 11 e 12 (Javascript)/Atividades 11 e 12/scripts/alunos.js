/**
 * Author: Victor Yukio Shirasuna, RA: 245155
 * Script Cadastro de Alunos
 */

"use strict";

// Vetor com os alunos cadastrados
var allAlunos = [];

// Classe com os registros de Aluno
class Aluno{

	constructor (name, ra, sexo, age, address, phone, email)
	{
		this._name = name;
		this._ra = ra;
		this._sexo = sexo;
		this._age = age;
		this._address = address;
		this._phone = phone;
		this._email = email;
	}

	get name()
	{
		return this._name;
	}

	get ra()
	{
		return this._ra;
	}

	get sexo()
	{
		return this._sexo;
	}

	get age()
	{
		return this._age;
	}

	get address()
	{
		return this._address;
	}

	get phone()
	{
		return this._phone;
	}

	get email()
	{
		return this._email;
	}
}

/**
 * - Esta funcao realiza o cadastro do aluno:
 * Pega os valores do formulario,
 * Cria um objeto Aluno,
 * Armazena o objeto no vetor com todos os alunos
 */
function registerAluno()
{
	// Formulario
	var myForm = document.forms["formulario"];

	// Valores dos campos
	var name = myForm["firstName"].value;
	var ra = myForm["ra"].value;
	var age = myForm["age"].value;
	var address = myForm["address"].value;
	var phone = myForm["phone"].value;
	var email = myForm["email"].value;
	var sexo;

	var radios = myForm["sexo"];
	if (radios[0].checked) 
	{
		sexo = "Masculino";
	}
	else
	{
		if (radios[1].checked) 
		{
			sexo = "Feminino";
		}
		else
		{
			sexo = "Não definido";
		}
	}

	// Cria objeto com os valores dos campos
	var newAluno = new Aluno(name, ra, sexo, age, address, phone, email);
	// Armazena o objeto
	allAlunos.push(newAluno);
	
	// Mostrar resultado
	alert(name + " foi cadastrado com sucesso!");

	return false;
}