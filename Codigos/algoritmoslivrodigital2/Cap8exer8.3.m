clear
clc
format long
%limites da integral de f(x)=1/(1+x)
a=1
b=3

%integral de gauss legendre
  m=5
  Gm=fGm83(a,b,m)
  Gm1=fGm83(a,b,m+1)
  ErroEstimadoGm=abs(Gm-Gm1)