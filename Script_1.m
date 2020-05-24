clear all, close all, clc
% MODELO DE CRECIMIENTO ECONÓMICO
  
% Literal c

A = 5;
alpha = 0.4; % A y alpha son constantes del total de productividad del capital
s = 0.1; % Tasa constante de ahorro
k0 = 1000; % Capital Inicial
t = 0:0.1:50;
% delta es la constante de depreciación

figure(1)
xlabel('tiempo')
ylabel('capital')
title('Delta')
hold on

valoresDelta = [0.2, 0.5, 0.8, 0.9];
for i=1:length(valoresDelta)
    delta = valoresDelta(i);
    term = (s*A)/delta;
    k = (term - (term - k0^(1-alpha))*exp((-delta.*t)*(1-alpha))).^(1/(1-alpha));
    plot(t,k)
end
legend('0.2', '0.5', '0.8', '0.9')
hold off
    
% Literal d

delta = 0.5;

figure(2)
xlabel('tiempo')
ylabel('capital')
title('Alpha')
hold on

valoresAlpha = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6];
term = (s*A)/delta;
for i=1:length(valoresAlpha)
    alpha = valoresAlpha(i);
    k = (term - (term - k0^(1-alpha))*exp((-delta.*t)*(1-alpha))).^(1/(1-alpha));
    plot(t,k)
end

legend('0.1', '0.2', '0.3', '0.4', '0.5', '0.6')
hold off
