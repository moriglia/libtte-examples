% Test Hypoexponential

hd = libtte.rv.estimateHypoexponential(15, 0.91); % generate hypoexponential descriptor
rvs = libtte.rv.generateHypoexponential(hd, 1e4);
fprintf("Mean: %f\n", rvs.mean());
fprintf("Variation coefficient: %f\n", rvs.variationCoefficient());