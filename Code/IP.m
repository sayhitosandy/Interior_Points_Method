function [x] = IP(A, b, c)

    na = size(A);
    x = ones(na(2),1);
    nu = ones(na(1),1);

    q = 1.4; %1.4 %5
    t = 0.4; %0.4 %1.4
    alpha = 1; %1
    iter = 0;

    while(1)
        [x_new, nu_new] = Newton(A, b', c', x, nu, t);
        x = x + alpha*x_new;
        nu = nu_new;
        t = q*t;

        if (na(2)/t < 0.5) %100 %0.5
            break;
        end
        iter = iter+1;
    end

    disp("Iterations = " + iter);
    disp("t = " + t);

end