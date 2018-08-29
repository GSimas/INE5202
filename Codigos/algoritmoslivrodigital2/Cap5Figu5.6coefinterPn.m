%Algoritmo Interpolador Polinomial Geral (via sistema de eqs. Lineares):
%Cálculo do erro exato de interpolação = |Pn(x)-f(x)|
clear
clc
format long
a = 1;
b = 8;
n = 2;
h = (b-a)/n;
x = a : h : b;
y = log(x);
C=fcoefinterPn(n,x,y)

%Plotagem e calculo do erro exato:
np = 100; %numero de intervalos para plotar grafico
hp = (b-a)/np;
xp = a:hp:b;
ye = log(xp);
yintp  = fPnH(n,C,xp);
erro  = abs(yintp - ye);
ErroMax=max(erro)


plot(x,y,'*k','markersize',20,xp,ye,'--k','LineWidth',2,xp,yintp,'-k','LineWidth',2)
legend('f(x) tabelada','f(x) exata','P2(x) interpolador','location','north')
%plot(xp,erro,"-k;Erro = | Pn(x)-f(x) |;",'LineWidth',2)
grid on
