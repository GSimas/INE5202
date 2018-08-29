clear
clc
m=5;%Numero de pontos experimentais 
%
x=[ 1 3	4	6	8 ]
y=[ 0 1	2	4	5 ]
xinicial=x(1)
xfinal  =x(m)
np= 64;                     % Numero de intervalos para analise e plotagem
hp=(xfinal-xinicial)/np;    % Valor espaçamento de cada intervalo para plotagem
xp=xinicial:hp:xfinal;      % Valores dos 'np+1' pontos xp(k) (k=1:np+1) 
%
% Aproximação de função por Ajuste de curvas (INDICADA PARA PONTOS EXPERIMENTAIS)
%
n1=1   % Ajuste a um polinomio de 1. grau, escolhido em função de seu comportamento grafico;
coef1=fdetajustePn(n1,m,x,y)
ya1=fPnH(n1,coef1,xp); % Calculo dos valores do polinomio ajustado em todos os xp
D1=fPnH(n1,coef1,x).-y
ymedio=sum(y)./m
SomaModulosDesvios=sum(abs(D1))
R1=1.-D1.^2 ./(ymedio.-y).^2


%plot(x,y,'*k','markersize',20,xp,ya1,'--k','LineWidth',2)% Plotagem dos pontos originais (*) e ajustadores
%legend('f(x) tabelada','P1(x) ajuste','location','north')
%grid on
plot(x,y,'*k','markersize',20,xp,ya1,'--k','LineWidth',2)% Plotagem dos pontos originais (*) e ajustadores
%legend('f(x) tabelada','P1(x) ajuste','location','north')
%grid on