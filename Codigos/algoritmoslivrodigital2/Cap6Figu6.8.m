clear
clc
%Comparativo entre serie de Maclaurin e Padé
%f(x)=arctag(x)
xa = -1;
xb = +1;
xp=xa:0.05:xb;
yep=atan(xp);

%2-aproximação por serie de maclaurin
%determinar coeficientes c
%yMac(x) = 0 + x + 0*x^2/2 - x^3/3 + 0*x^4/4! + x^5/5
%c (indice inicia em 1)
M=5
c = [0  1  0  -1/3  0  1/5] 
yMac=fPnH(M,c,xp);

%4-aproximação racional de padé
%yPade(x) = (a(1) + a(2)x + a(3)x^2 + a(4)x^3)/(1 + b(1)x + b(2)*x^2)
npade = 3
mpade = 2 %mpade>=1
M = npade + mpade

%R32 = (a(1) + a(2)x + a(3)x^2 + a(4)x^3)/(1 + b(1)x + b(2)*x^2)
[a b]=fPade(npade,mpade,c) %valido para n=n ou n=m+1

%yPade=(a(0+1) + a(1+1) .*xp + a(2+1) .*xp.^2 + a(3+1) .*xp.^3) ./(1 + b(1) .*xp + b(2) .*xp.^2);
yPade=fPnH(npade,a,xp)./fPnH(mpade,b,xp);

ErroMac =abs(yMac .-yep);
ErroPade=abs(yPade.-yep);
ErroMacmax =max(ErroMac)
ErroPademax=max(ErroPade)
%plot(x,y,'*k','markersize',20,xp,yep,".k;(x) = arctg(x);", xp,yip,"--k;Pn(x) interpolador n=5;",xp,yMac,"--r;SerieMaclaurim n=5;",xp,yPade,"-k;Racional Pade R32 M=5;")
%plot(xp,ErroMac,"--r;Erro=|M5(x)-arctg(x)| Maclaurin n=5;",xp,ErroPade,".-b; Erro=|R32(x)-arctg(x)|, R32(x)= Racional Pade M=5;")
%plot(xp,yep,"-.k;f(x) = arctg(x);", xp,yMac,"--k;SerieMaclaurim n=5;",xp,yPade,"-k;Racional Pade R32 M=5;",'linewidth',2)
plot(xp,ErroMac,"--k;Erro=|M5(x)-arctg(x)| Maclaurin n=5;",xp,ErroPade,"-k; Erro=|R32(x)-arctg(x)|, R32(x)= Racional Pade M=5;",'linewidth',2)
legend('location','north')
grid

