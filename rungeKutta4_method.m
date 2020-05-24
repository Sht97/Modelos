% Algoritmo para dos variables
function Y = rungeKutta4_method(funcion,xi,xf,yi,h)
    %h = (xf-xi)/N;
    x = xi:h:xf; % vector de valores de x con un muestreo de h
    y = zeros(1, length(x));
    y(1) = yi;
    for i=1:(length(x)-1)
        k1 = funcion(x(i),y(i));
        k2 = funcion(x(i)+(0.5*h), y(i)+(0.5*h*k1));
        k3 = funcion(x(i)+(0.5*h), y(i)+(0.5*h*k2));
        k4 = funcion(x(i)+h, y(i)+(k3*h));
        y(i+1) = y(i) + (h/6)*(k1 + (2*k2) + (2*k3) + k4);
    end
    Y = [x' y'];
end
