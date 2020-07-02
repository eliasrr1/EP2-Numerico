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
	void MMQ(char ch);
	std::vector<double> getP();
	void setP(std::vector<double>* p);
	double getLambda();

private:
	const int N, M;
	double lambda, deltaT, deltaX;
	std::vector<double> p, uT;

	double f(int k, int i, double p);
	double innerProduct(std::vector<double>* u, std::vector<double>* v);
	void printLine(std::vector<double>* line, std::ostream& output);

	std::vector<double> crankPontual(double p);
	std::vector<double> solveLDLtCN(std::vector<double>* diag, std::vector<double>* sub, std::vector<double>* b);
	std::vector<double> solveLDLt(std::vector<std::vector<double>>* N, std::vector<double>* B);
};