#include <iostream>
#include "Header Files/Vehicles.h"

/*
 * Programação Orientada a Objetos I - Unicamp
 *
 * Exercício Programa 5
 *
 * Projeto Final
 *
 * @author Victor Yukio Shirasuna, RA: 245155
 * @version 0.0.1
 */
int main() 
{
  Car carro("Toyota", "Corona", Color::GREY, 1998); // Criar um modelo de carro

  carro.TurnOn(); // Tentar ligar o carro
  carro.TurnOnBoardComputer(); // Tentar ligar o Computador de Bordo
}