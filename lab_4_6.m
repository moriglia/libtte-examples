% Test M/Cox2/1 stationary probability

lambda = 1;
mu1 = 2;
mu2 = 4;
a = 0.75;
N = 3;

cd = libtte.rv.CoxDescriptor([mu1, mu2], a);
[p0, R] = libtte.matrixgeometric.probabilityMCox21(lambda, cd, 1e-6, 1e4);

fprintf("p0=\t[%f %f]\n\n", p0(:));
fprintf("R=\t[%f %f;\n\t %f %f]\n", R(:,:));

% Find the probability that the number of users in the chain in steady
% state does not exceed N
Rtmp = eye(length(p0));
S = zeros(length(p0));
for i = 0:N
    S = S + Rtmp;
    Rtmp = Rtmp * R;
end

p03 = p0*S;
sum(p03)