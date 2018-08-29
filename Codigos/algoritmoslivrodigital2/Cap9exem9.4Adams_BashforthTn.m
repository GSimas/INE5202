clear
clc
format long
a=0.0 % Valor inicial de x
b=1.0 % Valor final de x

% Condição Inicial 1 p/ o 1o. ponto:
x(1)=a; % Valor inicial de x
y(1)=2; % Valor inicial de y

%Adams-Bashforth com integração por Trapezios
n=2^3  %Numero de subdivisões do intervalos [a,b]
% Condição Inicial y(2) obtida internamente por RK2 p/ 2o. ponto x(2)=x(1)+h

[x y5]=fAdams_BashforthTn(n,a,b,x,y)
ye=x.+1.+exp(-x);%Valor exato p/ comparação
erroAdams_BashforthTn=abs(y5(n+1)-ye(n+1))
[xa ya]=fAdams_BashforthTn(2*n,a,b,x,y); %Estimativa do valor exato
erroestimAdams_BashforthTn=abs(y5(n+1)-ya(2*n+1))