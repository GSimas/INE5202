clear
clc
format long
%Obter I=integral de  f(x)=1./(1.+x);  com erro maximo O(1e-6) 
%limites da integral
a=1
b=2
Ie=log(1+b)-log(1+a) %Integral exata, p validação do algoritmo

%metodo dos Trapezios
n=390  %para erro O(1e-6)
Tn=fTn6(n,a,b)
T2n=fTn6(2*n,a,b)    %Valor exato estimado c 2*n+1 pontos é suficiente
Erroexato=abs(Tn-Ie) %VA-VE
ErroexatoestimadoTn=abs(Tn-T2n)

%metodo de Simpson
n=26
Sn=fSn6(n,a,b)
S2n=fSn6(2*n,a,b)      %Valor exato estimado c 2*n+1 pontos é suficiente
ErroexatoSn=abs(Sn-Ie) %VA-VE
ErroexatoestimadoSn=abs(Sn-S2n)

%integral de Gauss Legendre
m=6
Gm=fGm10(a,b,m)
ErroexatoGm=abs(Gm-Ie) %VA-VE
G2m=fGm10(a,b,m+1)      %Valor exato estimado c m+1 pontos é suficiente
ErroexatoGmEstimado=abs(Gm-G2m)