% Algoritmo para una variable
function Y = euler_method(funcion,xi,xf,yi,N)
    h = (xf-xi)/N;
    Y = zeros(1, N+1);
    T = xi:h:xf;
    Y(1) = yi;
    for j=1:N
        Y(j+1) = Y(j)+h*funcion(Y(j));
    end
    M = max(Y)
    error = (M*(h^2))/2
    Y=[T' Y'];
end
