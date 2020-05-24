clc 
clear all
h = 0.01;
x = 1:h:5;
y = zeros(1,length(x));
y(1) = 5;
F = @(a,b) (2*a) - (3*b) + 1;

for i = 1:(length(x)-1)
    k1 = F(x(i), y(i));
    k2 = F(x(i) + (0.5*h), y(i) + (0.5*h*k1));
    k3 = F(x(i) + (0.5*h), y(i) + (0.5*h*k2));
    k4 = F(x(i) + h , y(i) + (k3*h));
    y(i+1) = y(i) + (h/6)*(k1 + (2*k2) + (2*k3) + k4);
end

plot(y,y,'b')
xlabel('x')
ylabel('y')