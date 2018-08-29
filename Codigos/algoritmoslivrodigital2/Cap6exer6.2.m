clear
clc
%f(x)=ln(x), x pertencente [0.1, +1], regiao próxima do ponto de descontinuidade, x=0
a = +0.1
b = +2.0
%mudança de variaveis para t pertencente [-1, +1]
%fx1(t)=log(0.5.*(b.-a).*t+0.5.*(b.+a))
ta=-1;
tb=+1;
%Comparativo entre aproximações polinomial, séries de Maclaurin, Tchebyshev e Padé:

%1-Interpolação polinomial para grau n >= 2
n = 44 %ETmax = x^(n+1)/(n+1)=~1e-6)
h = (tb-ta)/n;
t = ta:h:tb;
y = fx1(t,a,b);

np = 5*n;
tp=ta:(tb-ta)/np:tb;
ye = fx1(tp,a,b);
difdiv1=fdifdiv(n,t,y);
yip=fgregoryn(n,t,y,difdiv1,tp);
Eip=abs(yip.-ye);Eipmax=max(Eip)

%2-aproximação por serie de Maclaurin
%f(x) ~= 0 + x - x^2/2 + x^3/3 - x^4/4 + x^5/5 - ...+(-1)^(i+1)*x^i/i+
nM=104  %atinge o erro máximo limite O(1e-6)
cM=fcoefMaclaurin2(nM,a,b);
yM=fPnH (nM, cM, tp); %determina valor do polinomio de Maclaurin por Horner
erroMac    = abs(yM .- ye);
erroMacMax = max(erroMac)

%3-Aproximação numérica por serie com polinomios de Tchebyshev obtida pelo Teorema com grau 
nTC=24 %
cTC=fcoefTchebychev1(nTC,a,b);
%Serie de Tchebychev em função dos polinomios de Tchebychev Ti(x):
YTC=fcalculaTchebychev(nTC,cTC,tp);
erroTC=abs(YTC.-ye);
erroTCMax=max(erroTC)

%4-aproximação racional de padé
%Rnm = Pn(x)/Qm(x)
npade = 11
mpade = 11 %atinge o erro máximo limite O(1e-6), como os menores graus.
M = npade + mpade;
cM=fcoefMaclaurin2(M,a,b);
[aa bb]=fPade(npade,mpade,cM);
ypade= fPnH(npade,aa,tp)./fPnH(mpade,bb,tp);
Epade=abs(ypade.-ye);EpadeMax=max(Epade)

%podemos retornar apenas o valor xp=x(t) para plotar os graficos das funções avaliadas em t:
%xp=0.5.*(b.-a).*tp.+0.5.*(b.+a);

%plot(xp,Eip,".-.b;ErroPn(x) interpolador;",'linewidth',2,xp,EMac,".b;Erro Serie Maclaurin;",'linewidth',2,xp,erroTC,"-r; Erro Serie Tchebyshev;",'linewidth',2,xp,Epade,"-k; Erro Pade;",'linewidth',2)
%plot(xp,Eip,"-b;Erro Pn(x) interpolador;",'linewidth',2)
%plot(xp,erroMac,"-b;Erro Serie Maclaurin;",'linewidth',2)
%plot(xp,erroTC,"-r; Erro Serie Tchebyshev;",'linewidth',2)
%plot(xp,Epade,"-k; Erro Pade;",'linewidth',2)
%legend('location','north')

