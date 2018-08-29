clc
clear
%Algoritmo do método de Gauss-Seidel com fator de relaxação, aplicado ao exemplo 2.13: 
n1=3;n2=4;
fat=1.3   %fator de relaxação otimizado, por tentativas
tol=1e-6
for i=1:n2 xi(i)=0; end %valores iniciais da solucao
x =fGauss_Seidel1(n1,n2,xi,fat,tol)
xe=fGauss_Seidel1(n1,n2,x, fat,tol^2);%Valor exato estimado de referencia, com o dobro de precisao
ErroxMax=max(x.-xe)  %Erro de truncamento da solução x