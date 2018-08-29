%Algoritmo Interpolador Polinomial via Lagrange Otimizado e Tradicional:
%Cálculo do erro exato de interpolação = |Pn(x)-f(x)|
clear
clc
format long
a = 1;
b = 2;
n = 2;
h = (b-a)/n;
x = a : h : b;
y = f3(x);

%Plotagem e calculo do erro exato:
np = 100; %numero de intervalos para plotar grafico
hp = (b-a)/np;
xp = a:hp:b;
ye = f3(xp);
%yintp = fLagrange(n,x,y,xp); %forma otimizada
 yintp = fLagrange2(n,x,y,xp);%forma tradicional
erro  = abs(yintp - ye);
ErroMax=max(erro)

plot(x,y,'*k','markersize',20,xp,ye,'--k','LineWidth',1,xp,yintp,'-k','LineWidth',2)
legend('f(x) tabelada','f(x)=ln(x) exata','P2(x) interpolador','location','north')
%plot(xp,erro,"-k;Erro = | Pn(x)-f(x) |;",'LineWidth',2)
grid on
