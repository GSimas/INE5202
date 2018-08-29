%Algoritmo Curvas de Bezier para trecho UNICO
clear
clc
m=4 %numero de intervalos de um trecho UNICO das 6 figuras:
%y=[0 0  4  4];x=[0 4 4  0]; %parabola horizontal
%y=[0 9  9  0];x=[4 4 0  0]; %parabola vertical
%y=[3 6  0 -3];x=[0 5 6  1]; %parabola inclinada
%y=[3 1  5 -3];x=[0 2 2  3]; %parabola distorcida
%y=[0 4  4  0];x=[0 5 0  5]; %cuspide
y=[0 -1 -1 0];x=[0  1  -1  0]; %Gota
x(m+1)=x(1);y(m+1)=y(1);	%fechamento da gota
[xx yy]=fBezier(m,x,y);
plot(x,y,'x',x,y,'--b','linewidth',2,xx,yy,'-k','linewidth',2)