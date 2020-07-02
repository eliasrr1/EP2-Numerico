#include <iostream>
#include "Tarefa.h"
#include <limits.h>

void menu();

// Menu visual para recebimento de instrucoes
void menu()
{

	char item;
	std::cout << std::endl;
	std::cout << "Escolha o teste: ";
	std::cin >> item;
	item = (char)tolower(item);
	if (item == 'a')
	{
		Tarefa tarefa(128, 128);
		std::vector<double> p{ 0.35 };
		tarefa.setP(&p);
		tarefa.MMQ('a');
	}
	else if (item == 'b')
	{
		Tarefa tarefa(128, 128);
		std::vector<double> p{ 0.15, 0.3, 0.7, 0.8 };
		tarefa.setP(&p);
		tarefa.MMQ('b');
	}
	else if (item == 'c')
	{
		int N;
		std::cout << std::endl << "Digite o valor de N = M: ";
		std::cin >> N;
		if (!std::cin)
		{
			std::cin.clear();
			std::cin.ignore(INT_MAX, '\n');
			throw new std::invalid_argument("Digite um numero");
		}
		if ((2048 % N != 0) | (N == 1))
			throw new std::invalid_argument("Valor de N invalido");
		Tarefa tarefa(N, N);
		tarefa.arquivo();
		tarefa.MMQ('c');
	}
	else if (item == 'd')
	{
		int N;
		std::cout << std::endl << "Digite o valor de N = M: ";
		std::cin >> N;
		if (!std::cin)
		{
			std::cin.clear();
			std::cin.ignore(INT_MAX, '\n');
			throw new std::invalid_argument("Digite um numero");
		}
		if ((2048 % N != 0) | (N == 1))
			throw new std::invalid_argument("Valor de N invalido");
		Tarefa tarefa(N, N);
		tarefa.arquivo();
		tarefa.MMQ('d');
	}
	else
	{
		std::cin.clear();
		std::cin.ignore(INT_MAX, '\n');
		throw new std::invalid_argument("Digite apenas uma letra de A a D");
	}
	return;
}

int main()
{
	// INICIO
	std::cout << "====================" << std::endl;
	std::cout << "Exercicio Programa 2" << std::endl;
	std::cout << "====================" << std::endl;
	while (true)
	{
		try
		{
			menu();
		}
		catch (std::exception* e)
		{
			std::cout << std::endl << "** Erro na execucao do programa: " << e->what() << "! **" << std::endl;
			delete e;
		}
	}
	return 0;
}