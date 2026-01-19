# Project Summary

This repository contains files relevant to my talk "Modeling Transmission Lines: Numerical Solutions to the Telegrapher’s Equations." The goal of this project is to numerically solve the Telegrapher's Equations in one spatial dimension, given Dirichlet boundary conditions.

A recording of my talk can be found here: https://youtu.be/yO4-GEwpl-g?si=pn3dcmqWfBYHBcLq
  
# File summary
* Code
  * IBVP.m: The runnable file that solves the IBVP
  * f0.m: The function representing the initial voltage in the transmission line
  * f1.m: The function representing the initial voltage's rate of change with respect to time in the transmission line
  * g0.m: The function representing the voltage at the left endpoint of the transmission line
  * g1.m: The function representing the voltage at the right endpoint of the transmission line
  * teEqCT.m: The method that numerically solves the telegrapher's equations
* Paper
  * Modeling Transmission Lines.pdf: The accompanying paper for this project
