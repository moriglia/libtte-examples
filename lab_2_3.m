n = 50;
H1 = [0.1 0.9 0 ; 0.8 0.1 0.1 ; 0 0 1];
H2 = [0.95 0.05 0; 0.05 0.05 0.9; 0 0 1];
H3 = [0.05 0.95 0; 0.05 0.05 0.9; 0 0 1];

y1 = zeros(3, n);
y2 = zeros(3, n);
y3 = zeros(3, n);
p0 = [ 0 1 0 ];

y1 = libtte.sm.dtmcevolution(H1, p0, n);
y2 = libtte.sm.dtmcevolution(H2, p0, n);
y3 = libtte.sm.dtmcevolution(H3, p0, n);

[a1, V1, alpha1 ] =libtte.sm.findeigenvector(H1, p0);
[a2, V2, alpha2 ] =libtte.sm.findeigenvector(H2, p0);
[a3, V3, alpha3 ] =libtte.sm.findeigenvector(H3, p0);

x = 1:n;
plot(x, y1);
% grid on;
% hold on;
 plot(x, y2);
% plot(x, y3);