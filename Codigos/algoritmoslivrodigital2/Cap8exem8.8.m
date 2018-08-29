clear
clc
format long
%limites da integral de f(x)=1/(1+x)
a=1
b=6
Ie=log(1+b)-log(1+a)

%integral de gauss legendre
  m=3
 [Gm x y]=fGm10(a,b,m)
  ErroexatoGm=abs(Gm-Ie)
  n=m-1;
  coef=fcoefinterPn(n,x,y)
  IP2=coef(1)*(b-a)+coef(2)*(b^2-a^2)/2+coef(3)*(b^3-a^3)/3
  xp=a:(b-a)/100:b;
  ye=1./(1.+xp);
  yp=fPnH(n,coef,xp)
  plot(x,y,'*k','markersize',20,xp,ye,'--k',xp,yp,'-k','LineWidth',2)