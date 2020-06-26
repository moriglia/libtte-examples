% Test the matrix geometric algorithm for the M/E2/1 queue

import libtte.matrixgeometric.*

lambda = 0.9;
mu = 2;
accuracy = 1e-6;
STOP = 1e4;

[p0, R] = probabilityME21(lambda, mu, accuracy, STOP);