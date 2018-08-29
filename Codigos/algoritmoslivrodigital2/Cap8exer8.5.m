clear
clc
format long
%limites da integral de f(x)=ln(x)
a=0
b=1
Ie=b*(log(b)-1)-0%a*(log(a)-1) %calculada por limite em x=a=0

%integral de gauss legendre
for m=1:10
  m
  Gm=fGm10(a,b,m)
  ErroexatoGm=abs(Gm-Ie)
end