clc
clear
%f(x)=sen(x);         com x entre [a=-1;b=+1]
a = -1
b = +1

n = 7
h = (b - a)/n; % passo
t = a:h:b;
y = sin(t);

%plot func original
np = n*10;
hp = (b - a)/np;
tp = a:hp:b;
ye = sin(tp); %valor exato

#plot polinomio interpolador da base Gregory Newton
difdiv1=fdifdiv(n,t,y)
yI =fgregoryn(n,t,y,difdiv1,tp);
erroInter        = abs(yI.-ye);
erroInterMax = max(erroInter)

%Serie de Maclaurin n=7
n=7
'coeficientes da serie de MacLaurim:'
cM=[0 1 0 -1/factorial(3) 0 1/factorial(5) 0 -1/factorial(7)];
yM=fPnH(n,cM,tp);
erroMac       = abs(yM .- ye);
erroMacMax = max(erroMac)

#series de Tchebyshev
n=5
'coeficientes da serie de Tchebyshev:'
cC=[0 46079./46080.  0 -959./5760. 0 +23./2880.];
yC=fPnH(n,cC,tp);
erroCheb = abs(yC .- ye);
erroChebMax = max(erroCheb)

%plot(tp,erroInter,'linewidth',2,'-k',tp,erroMac,'linewidth',2,'--r', tp,erroCheb,'.-b','linewidth',2);
%legend('Erro(x)=|P7(x)-f(x)| interpolador de grau n=7','Erro(x)=|M7(x)-f(x)| Maclaurin n=7','Erro(x)=|C5(x)-f(x)| Chebyschev n=5','Aprox. de sen(x) por Chebyschev n=5','location','north')
plot(t, y, '*b','markersize',20,tp, ye,'.g','linewidth',2,tp, yI,'-k','linewidth',2,tp, yM,'--r','linewidth',2, tp, yC,'.-b','linewidth',2);
legend('f(x) tabelada','f(x)=sen(x)','Pn(x) interpolador de grau n=7','Aprox. de sen(x) por Maclaurin n=7','Aprox. de sen(x) por Chebyschev n=5','location','north')
grid();
