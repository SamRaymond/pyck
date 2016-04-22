%module CylindricalPacker

%{
#include "../cylindricalPacker.h"
%}

class CylindricalPacker
{
public:

  CylindricalPacker(double *xyz, double r, double ratio, double h, int state, double num_div = 3.0);
  CylindricalPacker(double *xyz, double r, double ratio, double *xyz, double h, int state, double num_div = 3.0);
  CylindricalPacker(double *xyz, double r, double ratioY, double ratioZ, double h, int state, double num_div = 3.0);


  void updateStates(double *xyz, double r,double ratio, int state);
  void updateStates(double *xyz, double r,double ratioY, double ratioZ, int state);

  double *getPositions();
  int *getStates();
  long getNumParticles();
  int getDim();
};
