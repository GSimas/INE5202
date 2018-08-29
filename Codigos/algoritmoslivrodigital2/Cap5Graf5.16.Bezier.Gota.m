%Algoritmo Curvas de Bezier
clear
m=4 %numero de intervalos de 6 figuras:
%y=[0 0 4  4];x=[0 4 4  0]; %parabola horizontal
%y=[0 9 9  0];x=[4 4 0  0]; %parabola vertical
%y=[3 6 0 -3];x=[0 5 6  1]; %parabola inclinada
%y=[3 1 5 -3];x=[0 2 2  3]; %parabola distorcida
%y=[0 4 4  0];x=[0 5 0  5]; %cuspide
y=[0 -1 -1 0];x=[0  1  -1  0]; %Gota
x(m+1)=x(1);y(m+1)=y(1);	
numpasso=1000
h=1/numpasso %Espaçamento do parametro t
t=0
cx=3*(x(2)-x(1));bx=3*(x(3)-x(2))-cx;ax=(x(4)-x(1))-(cx+bx);
cy=3*(y(2)-y(1));by=3*(y(3)-y(2))-cy;ay=(y(4)-y(1))-(cy+by);
xmax=0;ymax=0;
for i=1:numpasso+1
   xx(i)=x(1)+t*(cx+t*(bx+t*ax));
   yy(i)=y(1)+t*(cy+t*(by+t*ay));
   t=t+h;
end%for
plot(x,y,'*k',x,y,'--k','linewidth',2,xx,yy,'-k','linewidth',2)
grid on