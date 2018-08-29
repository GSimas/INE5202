clc
clear
format short 
%transformação de x para t E [-1, +1]
%f(x)=exp(x) x E [-1, +1]
a = -1;
b = +1;

n = 3   %Testar Np para que Erro máximo O(1e-3)
h = (b - a)/n; # passo
x = a:h:b;
y = exp(x);

#plot funcão original
np = 20*n;
hp = (b - a)/np;
xp = a:hp:b;
tp=(2.*xp.-(b+a))./(b-a);%plota sobre os mesmos pontos xp
ye = exp(xp);

#plot polinomio interpolador da base Gregory Newton
%difdiv1=fdifdiv(n,x,y);
%yp =fgregoryn(n,x,y,difdiv1,xp);
%erroInter    = abs(yp .- ye);
%erroInterMax = max(erroInter) 

#Serie de Maclaurin
%x(t)=0.5*(b-a)*t+0.5*(b+a);
%f(x(t))=exp(t+0)  com  t E [-1;+1]
Nm=4    %Testar Nm para que Erro máximo O(1e-3)
for i=0:Nm
		cM(i+1)=1/factorial(i); %coeficientes de exp(x) em ordem crescente de grau.
end #for
cM
yM=fPnH (Nm, cM, tp); 
erroMac    = abs(yM .- ye);
erroMacMax = max(erroMac) %erroMacMax =  0.0011441

%Séries de Tchebyshev-Maclaurin
%Partindo de Nm=4 %Testar Nc para que Erro máximo permance na O(1e-3):  
Nc1=3
cC1=[1.265625  1.125 0.2708333333333 0.04166666666666666]
yC1=fcalculaTchebychev(Nc1,cC1,tp);
erroCheb1    = abs(yC1 .- ye);
erroChebMax1 = max(erroCheb1)

Nc2=3
%0.376529922922979*T0+0.342592592592593*T1-0.0293209876543210*T2+0.00308641975308642*T3
%0.405850910577300 + 0.333333333333334 x - 0.058641975308642 x^2 + 0.0123456790123457 x^3
cC2=fcoefTchebychev(Nc2,a,b)
yC2=fcalculaTchebychev(Nc2,cC2,tp);
erroCheb2    = abs(yC2 .- ye);
erroChebMax2= max(erroCheb2)

%plot(xp,erroInter,'--k','linewidth',2,xp,erroMac,'.-k','linewidth',2,xp,erroCheb1,'-k','linewidth',1,xp,erroCheb2,'-k','linewidth',3);
%legend('Erro(x)=|P3(x)-f(x)| interpolador de grau n=3','Erro(x)=|M4(x)-f(x)| Maclaurin n=4','Erro(x)=|C3(x)-f(x)| Chebyschev-Maclaurin n=3','Erro(x)=|C3(x)-f(x)| Chebyschev n=3','location','north')
plot(xp,erroMac,'--k','linewidth',2,xp,erroCheb1,'-k','linewidth',1,xp,erroCheb2,'-k','linewidth',3);
%legend('Erro(x)=|M4(x)-f(x)| Maclaurin n=4','Erro(x)=|C3(x)-f(x)| Chebyschev-Maclaurin n=3','Erro(x)=|C3(x)-f(x)| Chebyschev n=3','location','north')
ylim([0,0.015])
%plot(x, y,'*b','markersize',20,xp,ye,'.r','linewidth',2,xp,yp,'-k', xp, yM,'.-b',xp,yC,'--r');
%legend('pontos tabelados','f(x)=exp(x) exato','P3(x) via Gregory Newton n=3;','M4(x) via Maclaurin n=4;','C3(x) via Tchebyshev n=3','location','north')
%grid();
