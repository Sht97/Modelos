clear all;
close all;
clc;
t_in = 0;
t_f = 100;
S_0 = 120;
I_0 = 298;
Beta = 0.5;
Gamma = 0.055;
Inicial = [S_0;I_0];
N = 1e6;
h = (t_f - t_in)/N;
y = Inicial;
S(1) = y(1);
I(1) = y(2);

for n = 1:N
    k1 = [-Beta*y(1)*y(2); Beta*y(1)*y(2) - Gamma*y(2)];
    k2 = [-Beta*(y(1) + (1/2)*h*k1(1))*(y(2) + (1/2)*h*k1(2)); 
        Beta*(y(1) + (1/2)*h*k1(1))*(y(2) + (1/2)*h*k1(2)) - Gamma*(y(2) + (1/2)*h*k1(2))];
    
    
    k3 = [-Beta*(y(1) + (1/2)*h*k2(1))*(y(1) + (1/2)*h*k2(1)); Beta*(y(1) + (1/2)*h*k2(1))*(y(2) + (1/2)*h*k2(2)) - Gamma*(y(2) + (1/2)*h*k2(2))];
    k4 = [-Beta*(y(1) + h*k3(1))*(y(2) + h*k3(2));Beta*(y(1) + h*k3(1))*(y(2) + h*k3(2)) - Gamma*(y(2) + h*k3(2))];
    y = y + (h/6)*(k1 + (2*k2) + (2*k3) + k4);
    S(n+1) = y(1);
    I(n+1) = y(2);
end

t = t_in:h:t_f;
R_0 = (Beta.*S)/Gamma;
R = R_0 + (Gamma.*I.*t);

figure(1)
plot(t,S,'-b','Linewidth',2)
hold on
plot(t,I,'-r','Linewidth',2)
hold on
% plot(t,R,'-m','Linewidth',2)
xlabel('Tiempo (meses)')
ylabel('Población')
title('Comportamiento de la enfermedad del H1N1 en un barrio pequeño')
% figure(2)
% plot(S,I,'k','Linewidth',2)
% xlabel('Población Susceptible al H1N1')
% ylabel('Población Infectada')
% title('Relación entre Población Susceptible al H1N1 la Población Infectada')
% figure(3)
% plot(S,R,'g','Linewidth',2)
% xlabel('Población Susceptible al H1N1')
% ylabel('Población Inmune')
% title('Relación entre Población Susceptible al H1N1 y la Población Inmune')
% figure(3)
% plot(I,R,'m','Linewidth',2)
% xlabel('Población Infectadas')
% ylabel('Población Inmune')
% title('Relación entre Población Infectada y la Población Inmune')