#include "Tarefa.h"
#include <fstream>
#include <string>
#include <algorithm>
#include <iostream>
#include <sstream>

Tarefa::Tarefa(int N, int M) : N(N), M(M)
{
	deltaT = 1 / (double)M;
	deltaX = 1 / (double)N;
	lambda = ((double)N * (double)N) / M;
	p = new std::vector<double>;
	uT = new std::vector<double>;
}

Tarefa::~Tarefa()
{
	delete p;
	delete uT;
}

void Tarefa::arquivo()
{
	std::ifstream entrada;
	std::istringstream linha;
	std::string s;
	entrada.open("teste.txt");

	// Verificar se o arquivo existe
	if (entrada.fail()) {
		entrada.close();
		throw new std::invalid_argument("Arquivo nao encontrado");
	}

	if (entrada.eof()) {
		entrada.close();
		throw new std::invalid_argument("Arquivo vazio");
	}

	std::getline(entrada, s);
	std::istringstream iss(s);
	while (std::getline(iss >> std::ws, s, ' '))
		p->push_back(std::stod(s));

	uT->resize(N + 1, 0);
	for (int i = 0; i < 2049; i++) {
		if (!entrada.good()) {
			entrada.close();
			throw new std::invalid_argument("Erro de formatacao");
		}
		if (i % (2048 / N) == 0)
			entrada >> uT->at(i * N / 2048);
		else
			entrada >> s;
	}
	return;
}

void Tarefa::MMQ(std::vector<double>* p, char ch)
{
	*(this->p) = *p;
	int N = (int)p->size();
	std::vector<std::vector<double>*>* base = new std::vector<std::vector<double>*>(N);
	std::vector<std::vector<double>*>* A = new std::vector<std::vector<double>*>(N);
	std::vector<double>* b = new std::vector<double>(N);
	std::vector<double>* coef = new std::vector<double>(N);
	double erroQuadratico = 0, uTCalc = 0;

	for (int i = 0; i < N; i++) {
		A->at(i) = new std::vector<double>(N);
		base->at(i) = crankPontual(p->at(i));
	}

	if (ch == 'a') {
		for (unsigned int i = 0; i < base->at(0)->size(); i++) {
			uT->push_back(7 * base->at(0)->at(i));
		}
	}
	else if (ch == 'b') {
		for (unsigned int i = 0; i < base->at(0)->size(); i++) {
			uT->push_back(2.3 * base->at(0)->at(i) + 3.7 * base->at(1)->at(i) + 0.3 * base->at(2)->at(i) + 4.2 * base->at(3)->at(i));
		}
	}

	for (int i = 0; i < N; i++) {
		for (int j = i; j < N; j++) {
			double produto = innerProduct(base->at(i), base->at(j));
			A->at(i)->at(j) = produto;
			A->at(j)->at(i) = produto;
		}
		b->at(i) = innerProduct(base->at(i), uT);
	}

	coef = solveLDLt(A, b);
	printLine(*coef, std::cout);

	for (unsigned int i = 1; i < uT->size() - 1; i++) {
		uTCalc = 0;
		for (int k = 0; k < N; k++) {
			uTCalc += coef->at(k) * base->at(k)->at(i);
		}
		erroQuadratico += (uT->at(i) - uTCalc) * (uT->at(i) - uTCalc);
	}
	erroQuadratico *= deltaX;
	std::cout << std::scientific << erroQuadratico << std::endl;

	for (int i = 0; i < N; i++) {
		delete base->at(i);
	}
	delete base;
	delete coef;
	return;
}

std::vector<double>* Tarefa::crankPontual(double p)
{
	// Vetores para armazenar a saida
	std::vector<double>* u = new std::vector<double>(N + 1, 0);
	std::vector<double>* uAnterior = new std::vector<double>(N + 1, 0);

	// Vetores intermediarios de calculo
	std::vector<double>* diag = new std::vector<double>(N - 1, 1 + lambda);
	std::vector<double>* sub = new std::vector<double>(N - 2, -lambda / 2);
	std::vector<double>* b = new std::vector<double>(N - 1, 0);
	std::vector<double>* temp = new std::vector<double>(N - 1, 0);

	// Calculo por metodo de Crank-Nicolson
	for (int k = 0; k < M; k++) {
		u->at(0) = 0;
		for (int i = 0; i < N - 1; i++) {
			b->at(i) = (1 - lambda) * uAnterior->at(i + 1) + (lambda / 2) * uAnterior->at(i) + (lambda / 2) * uAnterior->at(i + 2) + (deltaT / 2) * (f(k, i + 1, p) + f(k + 1, i + 1, p));
		}
		temp = solveLDLtCN(diag, sub, b);
		for (int i = 1; i < N; i++) {
			u->at(i) = temp->at(i - 1);
		}
		u->at(N) = 0;
		*uAnterior = *u;
	}

	delete diag;
	delete uAnterior;
	delete sub;
	delete b;
	delete temp;
	return u;
}

std::vector<double>* Tarefa::getP()
{
	return this->p;
}

double Tarefa::getLambda()
{
	return this->lambda;
}

double Tarefa::f(int k, int i, double p)
{
	double t = deltaT * k;
	double x = deltaX * i;
	if (x >= (p - deltaX / 2) && x <= (p + deltaX / 2))
		return (10 * (1 + cos(5 * t)));
	else
		return 0;
}

void Tarefa::printLine(std::vector<double> line, std::ostream& output)
{
	for (unsigned int i = 0; i < line.size(); i++) {
		output << std::scientific << line.at(i) << " ";
	}
	output << std::endl;
}

double Tarefa::innerProduct(std::vector<double>* u, std::vector<double>* v)
{
	double produto = 0;
	for (unsigned int i = 1; i < u->size() - 1; i++) {
		produto += u->at(i) * v->at(i);
	}
	return produto;
}

std::vector<double>* Tarefa::solveLDLtCN(std::vector<double>* diag, std::vector<double>* sub, std::vector<double>* b)
{
	//Determinacao de D e L
	std::vector<double>* d = new std::vector<double>(N - 1, 0);
	std::vector<double>* l = new std::vector<double>(N - 2, 0);

	double somaD = 0;
	for (int i = 0; i < N - 2; i++) {
		d->at(i) = diag->at(i) - somaD;
		l->at(i) = sub->at(i) / d->at(i);
		somaD = l->at(i) * l->at(i) * d->at(i);
	}
	d->at(N - 2) = diag->at(N - 2) - somaD;

	//Resolucao do sistema

	std::vector<double>* x = new std::vector<double>(N - 1, 0);

	double somaX = 0;
	for (int i = 0; i < N - 2; i++) {
		x->at(i) = b->at(i) - somaX;
		somaX = l->at(i) * x->at(i);
	}
	x->at(N - 2) = b->at(N - 2) - somaX;

	for (int i = 0; i < N - 1; i++) {
		x->at(i) = x->at(i) / d->at(i);
	}

	somaX = 0;
	x->at(N - 2) = x->at(N - 2) - somaX;
	for (int i = N - 3; i >= 0; i--) {
		somaX = l->at(i) * x->at(i + 1);
		x->at(i) = x->at(i) - somaX;
	}

	delete d;
	delete l;
	return x;
}

std::vector<double>* Tarefa::solveLDLt(std::vector<std::vector<double>*>* A, std::vector<double>* b)
{
	int N = (int)p->size();
	//Determinacao de D e L
	std::vector<double>* d = new std::vector<double>(N, 0);
	std::vector<std::vector<double>*>* l = new std::vector<std::vector<double>*>(N);

	for (int i = 0; i < N; i++) {
		l->at(i) = new std::vector<double>(N);
		l->at(i)->at(i) = 1;
	}

	double soma = 0;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j <= i; j++) {
			for (int k = 0; k <= j - 1; k++) {
				soma += l->at(j)->at(k) * d->at(k) * l->at(j)->at(k);
			}
			d->at(j) = A->at(j)->at(j) - soma;
			soma = 0;
			for (int k = 0; k <= j - 1; k++) {
				soma += l->at(i)->at(k) * d->at(k) * l->at(j)->at(k);
			}
			l->at(i)->at(j) = (A->at(i)->at(j) - soma) / d->at(j);
			soma = 0;
		}
	}

	//Resolucao do sistema

	std::vector<double>* x = new std::vector<double>(N, 0);

	for (int i = 0; i < N; i++) {
		soma = 0;
		for (int k = 0; k <= i - 1; k++) {
			soma += l->at(i)->at(k) * x->at(k);
		}
		x->at(i) = b->at(i) - soma;
	}

	for (int i = 0; i < N; i++) {
		x->at(i) = x->at(i) / d->at(i);
	}

	for (int i = N - 1; i >= 0; i--) {
		soma = 0;
		for (int k = i + 1; k < N; k++) {
			soma += l->at(k)->at(i) * x->at(k);
		}
		x->at(i) = x->at(i) - soma;
	}

	for (int i = 0; i < N; i++) {
		delete l->at(i);
	}
	delete l;
	delete d;
	delete A;
	delete b;
	return x;
}