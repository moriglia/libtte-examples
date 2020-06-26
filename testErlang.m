% testErlang

ed = libtte.rv.estimateErlang(2, 1/2.2361); % Erlang Descriptor
rvs = libtte.rv.generateErlang(ed, 1e4);
fprintf("Mean: %f\n", rvs.mean());
fprintf("Variation coefficient: %f\n", rvs.variationCoefficient());
