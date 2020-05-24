clear all, close all, clc

a = 10; % palabras aprendidas en un día
K = 3; % Kx: palabras olvidadas
ti = 0;
tf = 30;
h = 0.1;
t = [ti:h:tf];
x0 = 10; % número inicial de palabras aprendidas
    
% Solución analítica

figure(1)
title('Palabras')
xlabel('tiempo [días]')
ylabel('palabras memorizadas')
hold on
x = -(((a/K)-x0)*exp(-K.*t)) + a/K;
plot(t,x);
hold off


hold on
% Euler
f = @(x)a - K*x;
N = 1000;
YY = euler_method(f,ti,tf,x0,N);
plot(YY(:,1),YY(:,2))
hold off


hold on
% RK4
F = @(y,x)a -K*x;
h = 0.1;
YY = rungeKutta4_method(F,ti,tf,x0,h);
plot(YY(:,1),YY(:,2),'--k')
hold off
% legend('Solución analítica', 'Euler')
legend('Solución analítica', 'Euler', 'RK4')
