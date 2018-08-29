clear
clc
m=5 %Numero de pontos experimentais 
%
x=[0 0.25  0.50  0.75  1.00 ]
y=[1 1.32  1.79  1.64  1.41 ]
xinicial=x(1)
xfinal  =x(m)
np= 64;                     % Numero de intervalos para analise e plotagem
hp=(xfinal-xinicial)/np;    % Valor espaçamento de cada intervalo para plotagem
xp=xinicial:hp:xfinal;      % Valores dos 'np+1' pontos xp(k) (k=1:np+1) 
%
% Aproximação de função por Ajuste de curvas (INDICADA PARA PONTOS EXPERIMENTAIS)
%
n1=1   % Ajuste a um polinomio de 1. grau, escolhido em função de seu comportamento grafico;
m
coef1=fdetajustePn(n1,m,x,y)
ya1=fPnH(n1,coef1,xp); % Calculo dos valores do polinomio ajustado em todos os xp
desvioslocais=fPnH(n1,coef1,x).-y
ymedio       =sum(y)./m
D1=fModuloDesviosPn(n1,coef1,m,x,y)
R1=fCoefDeterminacaoPn(n1,coef1,m,x,y)

n2=2   % Ajuste a um polinomio de 2. grau, escolhido em funçãode seu comportamento grafico;
coef2=fdetajustePn(n2,m,x,y)
ya2=fPnH(n2,coef2,xp); % Calculo dos valores do polinomio ajustado em todos os xp
desvioslocais=fPnH(n2,coef2,x).-y
%ymedio       =sum(y)./m
D2=fModuloDesviosPn(n2,coef2,m,x,y)
R2=fCoefDeterminacaoPn(n2,coef2,m,x,y)

plot(x,y,'*k','markersize',20,xp,ya1,'--k','LineWidth',2,xp,ya2,'-k','LineWidth',2)% Plotagem dos pontos originais (*) e ajustadores
%legend('f(x) tabelada','P1(x) ajuste','P2(x) ajuste','location','northwest')
%grid on