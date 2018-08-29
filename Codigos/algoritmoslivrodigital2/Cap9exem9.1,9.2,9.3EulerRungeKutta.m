clear
clc
a=0.0 % Valor inicial de x
b=1.0 % Valor final de x
% Condição Inicial:
x(1)=a; % Valor inicial de x
y(1)=2; % Valor inicial de y

%Euler p/ EDO
n=2^3  % Numero de subdivisões do intervalor [a,b]

[x  y1]=fEuler(n,  a,b,x,y);
[xa ya]=fEuler(2*n,a,b,x,y);
ye=x.+1.+exp(-x);%Valor exato p comparação
erroEuler=abs(y1(n+1)-ye(n+1))
erroestimEuler=abs(y1(n+1)-ya(2*n+1))

%RK2 p/ EDO
n=2^3  % Numero de subdivisões do intervalor [a,b]
[x y2]=fRK2(n,a,b,x,y);
ye=x.+1.+exp(-x);%Valor exato p comparação
erroRK2=abs(y2(n+1)-ye(n+1))
[xa ya]=fRK2(2*n,a,b,x,y);
erroestimRK2=abs(y2(n+1)-ya(2*n+1))

%RK4 p/ EDO
n=2^3  % Numero de subdivisões do intervalor [a,b]
[x y4]=fRK4(n,a,b,x,y);
ye=x.+1.+exp(-x);%Valor exato p comparação
erroRK4=abs(y4(n+1)-ye(n+1))
[xa ya]=fRK4(2*n,a,b,x,y);
erroestimRK4=abs(y4(n+1)-ya(2*n+1))

%plot(x,ye,"k*;y(x) exata;",'markersize',20,x,y1,"-.k;Euler;",'linewidth',2,x,y2,"--k;RK2;",'linewidth',2,x,y4,"-k;RK4;",'linewidth',2)
%legend('location','north')
%grid on
plot(x,ye,'-k','linewidth',1,x,y1,'k*','markersize',10,x,y2,'ks','markersize',8,x,y4,'ko','markersize',15)
%legend('location','north')
%grid on