clear all, close all, clc
ti=0;
tf=100;
so=120;
io=268;
b=0.2;
k=0.055;
N=1e6;
h=(tf-ti)/N;
y=[so;io];
s(1)=y(1);
i(1)=y(2);
for n=1:N
   k1=[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2)];
   
   k2=[-b*(y(1)+(1/2)*h*k1(1))*(y(2)+(1/2)*h*k1(2));b*(y(1)+(1/2)*h*k1(1))*(y(2)+(1/2)*h*k1(2))-k*(y(2)+(1/2)*h*k1(2))];
   k3=[-b*(y(1)+(1/2)*h*k2(1))*(y(1)+(1/2)*h*k2(1));b*(y(1)+(1/2)*h*k2(1))*(y(2)+(1/2)*h*k2(2))-k*(y(2)+(1/2)*h*k2(2))];

   k4=[-b*(y(1)+h*k3(1))*(y(2)+h*k3(2));b*(y(1)+h*k3(1))*(y(2)+h*k3(2))-k*(y(2)+h*k3(2))];
   y=y+(h/6)*(k1+2*k2+2*k3+k4);
   s(n+1)=y(1);%personas suceptibles
   i(n+1)=y(2);%personas infectadas
end
t=ti:h:tf;
figure(1)
plot(t,i,'Linewidth',2)
hold on
plot(t,s,'Linewidth',2)
xlabel('Tiempo (dias)');
ylabel('Población infectada')
legend( 'Infectados', 'Suceptibles')

figure(2)
plot(s,i,'Linewidth',2)
hold on
xlabel('suceptibles');
ylabel('infectadas')