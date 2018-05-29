///////
// author: Malte Buschmann
// Description: Generates HepMC files for the process
// 	p p -> Z' -> DM DM  with dark abelian shower DM -> DM A' attached
//
//  see arXiv:1505.07459 for further details


#include <fstream>
#include <stdlib.h>
#include "math.h"

using namespace std;

//****************************************************************************
// MAIN
//****************************************************************************

double pw(double g,double mZp,double Q, double mX)
{
	return 1./12./3.141592654*g*g*mZp*Q*sqrt( 1. - 4.*mX*mX/mZp/mZp )*(1.+2.*mX*mX/mZp/mZp);
}

int main(int argc,const char* argv[]) 
{
	double q1 = pw(atof(argv[1]),atof(argv[3]), 2./3.,0.0022);
	double q2 = pw(atof(argv[1]),atof(argv[3]), 2./3.,1.28);
	double q3 = pw(atof(argv[1]),atof(argv[3]), 2./3.,173.1);
	double q4 = pw(atof(argv[1]),atof(argv[3]),-1./3.,0.0047);
	double q5 = pw(atof(argv[1]),atof(argv[3]),-1./3.,0.096);
	double q6 = pw(atof(argv[1]),atof(argv[3]),-1./3.,4.18);
	double x  = pw(atof(argv[2]),atof(argv[3]),1.,atof(argv[4]));
	fstream fout;
	fout.open("width.inc",ios::out);
	fout << "GAMMA=" << q1+q2+q3+q4+q5+q6+x << endl;
	fout.close();

	return 0;
}
