clear
clc
format long
%Obter I=integral de Tchebychev de f(x)=ln(1.+x);  com erro maximo O(1e-6) 
a=-1
b=+1
Ie=-pi*log(2) %integral_(-1)^(+1) (log(1+x))/sqrt(1-x^2) dx = -π log(2)≈-2.17759
m=1e4 %com m=1e6 Erro GTm~2.1775475e-06
GTm =FGTm(m) 
ErroexatoGTm=abs(GTm-Ie)
