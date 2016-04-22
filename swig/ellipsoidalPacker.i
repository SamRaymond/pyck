%module EllipsoidalPacker

%{
#include "../ellipsoidalPacker.h"
%}

class EllipsoidalPacker
{
public:

  EllipsoidalPacker(double *xyz, double r, double ratio,double h, int state, double tolerance_angle = 0.001, double tolerance_h = 0.55, bool random_startingpoint = true, bool adjust_h = true);
  EllipsoidalPacker(double *xyz, double r, double ratio, double *xyz, double h, int state, double tolerance_angle = 0.001, double tolerance_h = 0.55, bool random_startingpoint = true, bool adjust_h = true);
  EllipsoidalPacker(double *xyz, double r, double ratioY, double ratioZ, double h, int state, double tolerance_angle = 0.001, double tolerance_h = 0.55, bool random_startingpoint = true, bool adjust_h = true);

  void updateStates(double *xyz, double r0, double h, double r,double ratio, int state);
  void updateStates(double *xyz, double r0, double h, double r,double ratioY, double ratioZ, int state);

  double *getPositions();
  int *getStates();
  long getNumParticles();
  int getDim();
};
