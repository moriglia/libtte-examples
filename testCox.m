% Test Cox

cdesc = libtte.rv.estimateCox(58, 3);
rvs = libtte.rv.generateCox(cdesc, 1e5);
fprintf("Mean: %f\n",rvs.mean());
fprintf("Variation coefficient: %f\n", rvs.variationCoefficient());

clear cdesc ;

cdesc = libtte.rv.estimateCox(4, 0.4);
rvs = libtte.rv.generateCox(cdesc, 1e5);
fprintf("Mean: %f\n",rvs.mean());
fprintf("Variation coefficient: %f\n", rvs.variationCoefficient());
