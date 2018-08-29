format short
clear
clc
%definiçao do dominio retangular x e y 
x=[8.5  8.9	  9.3  9.5  9.6     ] %n=5 colunas
y=[5.0  5.7  6.2  6.7  7.0  7.5 ] %m=6 linhas
n=length(x)-1 %n grau de Px
m=length(y)-1 %n grau de Py
g=4; %campo exemplo potencia g
for i=1:n+1 for j=1:m+1 z(j,i)=x(i)^g+y(j)^g; end end %Exemplo de função 
%Calcule Pt dentro do dominio:
xt=8.7  
yt=5.5
printf("\n Interpolacao 2-D via Gregory-Newton\n")
zt=fGregory2D (n,x,m,y,z,xt,yt)
printf("\n Interpolacao 2-D via Lagrange\n")
zt=fLagrange2D(n,x,m,y,z,xt,yt)
printf("\n Valor exato\n")
ze=xt.^g+yt.^g %valor exato para comparação
Erroz=abs(zt.-ze)./ze*100