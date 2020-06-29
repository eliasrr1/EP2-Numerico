#pragma once
#include <math.h>
#include <vector>
#include <ostream>
#include <stdexcept>

class Tarefa
{
public:
	Tarefa(int N, int M);
	~Tarefa();

	void arquivo();
	void MMQ(std::vector<double>* p, char ch);
	std::vector<double>* getP();
	double getLambda();

private:
	const int N = 0;
	const int M = 0;
	double lambda = 0;
	double deltaT = 0; 
	double deltaX = 0;
	std::vector<double>* p;
	std::vector<double>* uT;

	double f(int k, int i, double p);
	double innerProduct(std::vector<double>* u, std::vector<double>* v);
	void printLine(std::vector<double> line, std::ostream& output);

	std::vector<double>* crankPontual(double p);
	std::vector<double>* solveLDLtCN(std::vector<double>* diag, std::vector<double>* sub, std::vector<double>* b);
	std::vector<double>* solveLDLt(std::vector<std::vector<double>*>* N, std::vector<double>* B);
};