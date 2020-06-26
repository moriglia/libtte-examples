% Example 4.8
% A queue has one server which can be in order or out of order,
% requests are served only when the server is in order,
% the server can go in or out of order independently on the resitual
% service time and the service is interrupted when out of order
% Service times are exponential
% Permanence in functioning state in or out of order are exponential

import libtte.matrixgeometric.*

%% Parameters
lambda = 1;
mu = 5;  % service rate
a = 1/8; % rate of transition from out of order to in order
b = 1/5; % rate of transition from in order to out of order

if lambda / mu >= a/(a + b)
    error("The chain is not ergodic");
end

%% Matrix geometric solution
A{1} = lambda * eye(2);
B{1} = -A{1} + [-b b; a -a];
B{2} = [mu 0; 0 0];
A{2} = B{1} - B{2};
A{3} = B{2};

R = rmatrix(A{:}, true, 1e-9, 1e5);
p0 = findp0(R, B{:}, true);

%% Probability of having more than 10 users in the queue
% implement \sum_{i=0}^10 p_i = p_0\sum_{i=0}^10 R^i
S = zeros(2);
Rtmp = eye(2);
for i = 0:10
    S = S + Rtmp;
    Rtmp = Rtmp * R;
end

p_morethan10 = sum(p0 * S);
p_lessthan10 = 1 - p_morethan10