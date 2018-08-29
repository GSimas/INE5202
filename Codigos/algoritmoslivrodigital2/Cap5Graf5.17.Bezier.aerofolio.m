%Algoritmo Curvas de Bezier Aerofolio
clear
n=4 %pontos de 6 figuras:
%y=[0 0 4  4];x=[0 4 4  0]; %parabola horizontal
%y=[0 9 9  0];x=[4 4 0  0]; %parabola vertical
%y=[3 6 0 -3];x=[0 5 6  1]; %parabola inclinada
%y=[3 1 5 -3];x=[0 2 2  3]; %parabola distorcida
%y=[0 4 4  0];x=[0 5 0  5]; %cuspide
%y=[0 -100 -100 0];
%x=[0  1  -1  0]; %Gota
%x(n+1)=x(1);y(n+1)=y(1);
n=1000
h=1/n %Espaçamento do parametro t
xp=[];yp=[];xn=[];yn=[];
%Asa
% parte 1: segmento AB
x(1)=0;    y(1)=0;
x(2)=1;    y(2)=1; %inclinação inicio = 45º entre 1 e 2
x(3)=1.9;  y(3)=1; %inclinação final  =  0º entre 3 e 4
x(4)=2;    y(4)=1;
t=0
cx=3*(x(2)-x(1));bx=3*(x(3)-x(2))-cx;ax=(x(4)-x(1))-(cx+bx);
cy=3*(y(2)-y(1));by=3*(y(3)-y(2))-cy;ay=(y(4)-y(1))-(cy+by);
xmax=0;ymax=0;
for i=1:n+1
   xx(i)=x(1)+t*(cx+t*(bx+t*ax));
   yy(i)=y(1)+t*(cy+t*(by+t*ay));
   t=t+h;
end%for
xp=[xp xx];yp=[yp yy];xn=[xn x];yn=[yn y];

% parte 2: segmento BC
x(1)=2;   y(1)=1;
x(2)=3;   y(2)=1;                                   %inclinação inicio = 0º
x(3)=8-1; y(3)=0.2+1*tan(10*pi/180); %inclinação final  = 10º
x(4)=8;   y(4)=0.2;
t=0
cx=3*(x(2)-x(1));bx=3*(x(3)-x(2))-cx;ax=(x(4)-x(1))-(cx+bx);
cy=3*(y(2)-y(1));by=3*(y(3)-y(2))-cy;ay=(y(4)-y(1))-(cy+by);
xmax=0;ymax=0;
for i=1:n+1
   xx(i)=x(1)+t*(cx+t*(bx+t*ax));
   yy(i)=y(1)+t*(cy+t*(by+t*ay));
   t=t+h;
end%for
xp=[xp xx];yp=[yp yy];xn=[xn x];yn=[yn y];

% parte 3: segmento CD
x(1)=8;      y(1)=0.2;
x(2)=8+0.5;  y(2)=0.2-0.5*tan(10*pi/180); %inclinação inicio = 10º
x(3)=10-0.5; y(3)=0+0.5*tan(05*pi/180);   %inclinação final   = 5º
x(4)=10;     y(4)=0;
t=0
cx=3*(x(2)-x(1));bx=3*(x(3)-x(2))-cx;ax=(x(4)-x(1))-(cx+bx);
cy=3*(y(2)-y(1));by=3*(y(3)-y(2))-cy;ay=(y(4)-y(1))-(cy+by);
xmax=0;ymax=0;
for i=1:n+1
   xx(i)=x(1)+t*(cx+t*(bx+t*ax));
   yy(i)=y(1)+t*(cy+t*(by+t*ay));
   t=t+h;
end%for
xp=[xp xx];yp=[yp yy];xn=[xn x];yn=[yn y];

plot(xn,yn,'--k',xn,yn,'*k','markersize',10,xp,yp,'-k','linewidth',2)
ylim([-0.5 4.5])
grid on