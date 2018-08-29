clc
clear
format short 
%transformação de x E [+1, +2] para t
%f(x)=ln(x) 
a = +1;
b = +2;


#plot funcão original
np = 100;
hp = (b - a)/np;
xp = a:hp:b;
tp = (2.*xp.-(b+a))./(b-a);%plota sobre os mesmos pontos xp
ye = fx1(tp,a,b);

#Serie de Maclaurin
%x(t)=0.5*(b-a)*t+0.5*(b+a);
%f(x(t))=exp(t+0)  com  t E [-1;+1]

Nm=9    %Testar Nm para que Erro máximo O(1e-3)
cM=fcoefMaclaurin2(Nm,a,b)
yM=fPnH (Nm, cM, tp); 
erroMac    = abs(yM .- ye);
erroMacMax = max(erroMac) %erroMacMax =  0.0011441


Nc=6
cC=fcoefTchebychev1(Nc,a,b)
yC=fcalculaTchebychev(Nc,cC,tp);
erroCheb    = abs(yC .- ye);
erroChebMax = max(erroCheb)

plot(xp,erroMac,'--k','linewidth',2,xp,erroCheb,'-k','linewidth',2);
%legend('Erro(x)=|M9(x)-f(x)| Maclaurin n=9','Erro(x)=|C6(x)-f(x)| Chebyschev n=6','location','north')

%plot(x, y,'*b','markersize',20,xp,ye,'.r','linewidth',2,xp,yp,'-k', xp, yM,'.-b',xp,yC,'--r');
%legend('pontos tabelados','f(x)=exp(x) exato','P3(x) via Gregory Newton n=3;','M4(x) via Maclaurin n=4;','C3(x) via Tchebyshev n=3','location','north')
%grid();
