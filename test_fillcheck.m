% Test fillcheck

H = zeros(9);
H = libtte.sm.fillcheck(H, @check_diag, 5);
H = libtte.sm.fillcheck(H, @check_upper_triangular, 6);
H = libtte.sm.fillcheck(H, @check_fancy, 4);

M = zeros(6);
ck = make_custom_checker(M);
M = libtte.sm.fillcheck(M, ck, 2)



function ret = check_diag(x, y)
    ret = x == y;
end

function ret = check_upper_triangular(x,y)
    ret = y > x;
end

function ret = check_fancy(x, y)
    ret = x + y > 9 || x / y == 5;
end

function f = make_custom_checker(H)
    s = size(H, 1);
    function ret = custom_checker(x, y)
        ret = x + y == s;
    end
    
    f = @custom_checker ;
end
