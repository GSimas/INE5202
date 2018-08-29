%Algoritmo Curvas de Bezier
clear
m=4 %numero de intervalos 
x=[2.5  5  2.5 0];y=[3 -0.5 -4  0]; %4 Bezier 3 grau
%x(m+1)=x(1);y(m+1)=y(1);	%nao fecha com o ultimo ponto
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

m=3 %numero de intervalos 
x2=[3 0.5 2.5 ];y2=[5 5  3 ]; %4 Bezier 2 grau
x2(m+1)=x(1);y2(m+1)=y(1);	
numpasso=1000
h=1/numpasso %Espaçamento do parametro t
t=0
bx=2*(x2(2)-x2(1));ax=x2(1)-2*x2(2)+x2(3);
by=2*(y2(2)-y2(1));ay=y2(1)-2*y2(2)+y2(3);
xmax=0;ymax=0;
for i=1:numpasso+1
   xx2(i)=x2(1)+t*(bx+t*ax);
   yy2(i)=y2(1)+t*(by+t*ay);
   t=t+h;
end%for
plot(x,y,'ok',x,y,'--k','linewidth',2,xx,yy,'-k','linewidth',2,x2,y2,'ok',x2,y2,'--k','linewidth',2,xx2,yy2,'-k','linewidth',2)
grid on