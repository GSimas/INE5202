clc
clear
format short 
%transformação de x para t E [-1, +1]
%f(x)=sen(x) x E [-1, +1]
a = -1;
b = +1;

n = 5   %Testar Np para que Erro máximo O(1e-6)
h = (b - a)/n; # passo
x = a:h:b;
y = sin(x);

#plot funcão original
np = 20*n;
hp = (b - a)/np;
xp = a:hp:b;
tp=(2.*xp.-(b+a))./(b-a);%plota sobre os mesmos pontos xp
ye = sin(xp);

#plot polinomio interpolador da base Gregory Newton
difdiv1=fdifdiv(n,x,y);
yp =fgregoryn(n,x,y,difdiv1,xp);
erroInter    = abs(yp .- ye);
erroInterMax = max(erroInter) 

#Serie de Maclaurin
%x(t)=0.5*(b-a)*t+0.5*(b+a);
%f(x(t))=sen(t+0)  com  t E [-1;+1]
Nm=7    %Testar Nm para que Erro máximo O(1e-6)
cM=fcoefMaclaurin3(Nm)
yM=fPnH (Nm, cM, tp); 
erroMac    = abs(yM .- ye);
erroMacMax = max(erroMac) 

%Séries de Tchebyshev-Maclaurin
%Partindo de Nm=7 %Testar Nc para que Erro máximo permance na O(1e-6):  
Nc=5
cC1=[ 0 46079/46080 0 -959/5760 0 23/2880 ]
yC1=fPnH(Nc,cC1,tp);
erroCheb1    = abs(yC1 .- ye);
erroChebMax1 = max(erroCheb1)

Nc=5
cC=fcoefTchebychev3(Nc,a,b)
yC=fcalculaTchebychev(Nc,cC,tp);
erroCheb    = abs(yC .- ye);
erroChebMax = max(erroCheb)
%plot(xp,erroInter,'--k','linewidth',2,xp,erroMac,'.-k','linewidth',2,xp,erroCheb1,'-k','linewidth',1,xp,erroCheb,'-k','linewidth',3);
%legend('Erro(x)=|P5(x)-f(x)| interpolador de grau n=5','Erro(x)=|M7(x)-f(x)| Maclaurin n=7','Erro(x)=|C5(x)-f(x)| Chebyschev-Maclaurin n=5','Erro(x)=|C5(x)-f(x)| Chebyschev n=5','location','north')
plot(xp,erroMac,'--k','linewidth',2,xp,erroCheb1,'-k','linewidth',1,xp,erroCheb,'-k','linewidth',3);
%legend('Erro(x)=|M7(x)-f(x)| Maclaurin n=7','Erro(x)=|C5(x)-f(x)| Chebyschev-Maclaurin n=5','Erro(x)=|C5(x)-f(x)| Chebyschev n=5','location','north')

%plot(xp,erroCheb1,'-k','linewidth',1,xp,erroCheb,'-k','linewidth',3);
%legend('Erro(x)=|C5(x)-f(x)| Chebyschev-Maclaurin n=5','Erro(x)=|C5(x)-f(x)| Chebyschev n=5','location','north')

