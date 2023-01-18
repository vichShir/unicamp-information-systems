/**
 * Author: Victor Yukio Shirasuna, RA: 245155
 * Script Mostrar Todos os Alunos Cadastrados
 */

"use strict";

/**
 * - Esta funcao mostra os alunos cadastrados:
 * Limpa o painel anterior,
 * Criar o novo painel,
 * Adiciona os alunos cadastrados no painel
 */
function showAll()
{
	// Remover o painel
	try
	{
		var myobj = document.getElementById("showAlunos");
		myobj.remove();
	}
	catch(err)
	{
		// Painel nulo
	}

	// Adicionar section com os dados dos alunos
	addElementWithID("section", "panel", "showAlunos");
	// Adicionar titulo
	addElementValue("h1", "showAlunos", "Alunos Cadastrados");
	// Adicionar barra no titulo
	addElement("hr", "showAlunos");

	if (allAlunos.length > 0)
	{
		// Adicionar os campos do objeto Aluno
		for(var i = 0; i < allAlunos.length; i++)
		{
			var id = "Aluno " + i;
			var nome = "Nome: " + allAlunos[i].name;
			var ra = "RA: " + allAlunos[i].ra;
			var sexo = "Sexo: " + allAlunos[i].sexo;
			var age = "Idade: " + allAlunos[i].age;
			var address = "Endereço: " + allAlunos[i].address;
			var phone = "Telefone: " + allAlunos[i].phone;
			var email = "E-mail: " + allAlunos[i].email;

			addElementValue("h3", "showAlunos", id);
			addElement("hr", "showAlunos");
			addElementValueWithClass("p", "showAlunos", "show-field", nome);
			addElementValueWithClass("p", "showAlunos", "show-field", ra);
			addElementValueWithClass("p", "showAlunos", "show-field", sexo);
			addElementValueWithClass("p", "showAlunos", "show-field", age);
			addElementValueWithClass("p", "showAlunos", "show-field", address);
			addElementValueWithClass("p", "showAlunos", "show-field", phone);
			addElementValueWithClass("p", "showAlunos", "show-field", email);
		}
	}
	else
	{
		addElementValue("p", "showAlunos", "Nenhum aluno cadastrado.");
		addElementValue("p", "showAlunos", "Faça seu cadastro acima.");
	}
}

function addElement(type, on)
{
	var elem = document.createElement(type);
	document.getElementById(on).appendChild(elem);
}

function addElementValue(type, on, innerValue)
{
	var elem = document.createElement(type);
	elem.innerHTML = innerValue;
	document.getElementById(on).appendChild(elem);
}

function addElementValueWithClass(type, on, className, innerValue)
{
	var elem = document.createElement(type);
	elem.innerHTML = innerValue;
	elem.setAttribute('class', className);
	document.getElementById(on).appendChild(elem);
}

function addElementWithID(type, on, idName)
{
	var elem = document.createElement(type);
	elem.setAttribute('id', idName);
	document.getElementById(on).appendChild(elem);
}