% Lab champter 4

% Evaluate the probability of rejection for a M/M/Ns/Nw queue
lambda = 0.5;
mu = 0.2;
Ns = 3;
Nw = 5;

queue = libtte.queue.MMNsNwQueue(lambda, mu, Ns, Nw);
p = libtte.stationary.zeropivot(queue.rtm);
P_rejection = p(Ns + Nw + 1);

fprintf("The probability if rejection for a M/M/Ns/Nw queue\n");
fprintf("with parameters:\nlambda=\t%f\nmu=\t%f\nNs=\t%f\nNw=\t%f\n", lambda, mu, Ns, Nw);
fprintf("is P_rej = %f\n", P_rejection);