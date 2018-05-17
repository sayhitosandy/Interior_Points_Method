function [x_new, nu_new] = Newton(A, b, c, x, nu, t)
%  Solves KKT conditions
%  [P -A]   = [  c ]
%  [A  0]     [b-Ax]

    hess = 1./(t*(x.^2)); 

    P = diag(hess);
    na = size(A');

    O = zeros(na(2));

    lhs = [[P, A']; [A, O]];
    rhs = [-c; (b - A*x)];

    res = linsolve(lhs, rhs);

    x_new = res(1:na(1));
    nu_new = res(na(1):na(1)+na(2)-1);

end