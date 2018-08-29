clear
clc
format long
%Obter I com erro maximo O(1e-6)
%limites da integral
a=1
b=2
%integral de gauss legendre
m=1;
ErroexatoGmEstimado=1;
while (ErroexatoGmEstimado>sqrt(10)*1e-6 && m<5)
  m=m+1
  Gm=fGm(a,b,m)
  G2m=fGm(a,b,m+1)      %Valor exato estimado c m+1 pontos é suficiente
  ErroexatoGmEstimado=abs(Gm-G2m)
end
m