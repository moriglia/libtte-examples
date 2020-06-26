% Esempio 2.2

H = build_H(4, 0.3, 0.2);
p0 = zeros(1, 9);
p0(5) = 1;
p4 = p0*H^4;
result1 = sum(p4(4:6));

M = zeros(4);
M = libtte.sm.fillcheck(M, @check_plus1, 0.3);
M = libtte.sm.fillcheck(M, @check_minus1, 0.2);
M(4,:) = zeros(1,4);
M(1,4) = 0.2;
M(3,4) = 0.3;
M = libtte.sm.normalize(M);
p10_never = [0 1 0 0]*M^10;
result2 = 1 - p10_never(4);
pnever = zeros(1, 50);
for x = 1:50
    pn = [0 1 0 0]*M^x;
    pnever(x) = 1 - pn(4);
end
semilogy(1:50, pnever);



function ret = build_H(n, pp1, pm1)
% build_H(n, pp1, p0, pm1)
% n: number of extractions
% pp1: probability of extracting +1
% pm1: probability of extracting -1

    H   = zeros(2*n + 1);
    H   = libtte.sm.fillcheck(H, @check_plus1, pp1);
    H   = libtte.sm.fillcheck(H, @check_minus1, pm1);
    ret = libtte.sm.normalize(H);
end

function ret = check_plus1(x,y)
    ret = (x+1) == y ;
end
function ret = check_minus1(x,y)
    ret = (y+1) == x ;
end
