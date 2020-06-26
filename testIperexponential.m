% Test the library

import libtte.rv.* ;

id = libtte.rv.estimateIperexponential(2, 1.8);
rvs = libtte.rv.generateIperexponential(id, 1e5);
fprintf("Mean: %f\n", rvs.mean());
fprintf("Variation coefficient: %f\n", rvs.variationCoefficient());
% clear rvs id;