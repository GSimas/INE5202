clear
clc
a=0.0 % Valor inicial de x
b=2.0 % Valor final de x

xe=a:0.01:b;
ye=xe.*exp(-xe);%Valor exato p comparação

% Condição Inicial:
x(1)=a  % Valor inicial de x
y(1)=0; % Valor inicial de y

%Euler p/ EDO
n=2  % Numero de subdivisões do intervalor [a,b]
[x y1]=fEulerb(n,a,b,x,y);

erroEuler=abs(y1(n+1)-ye(n+1))
[xa ya]=fEulerb(2*n,a,b,x,y);
erroestimEuler=abs(y1(n+1)-ya(2*n+1))

%RK2 p/ EDO
[x y2]=fRK2b(n,a,b,x,y);
erroRK2=abs(y2(n+1)-ye(n+1))
[xa ya]=fRK2b(2*n,a,b,x,y);
erroestimRK2=abs(y2(n+1)-ya(2*n+1))

%RK4 p/ EDO
[x y4]=fRK4b(n,a,b,x,y);
erroRK4=abs(y4(n+1)-ye(n+1))
[xa ya]=fRK4b(2*n,a,b,x,y);
erroestimRK4=abs(y4(n+1)-ya(2*n+1))

%plot(xe,ye,"-k;y(x) exata;",'linewidth',2,x,y1,"-.k;Euler;",'linewidth',2,x,y2,"--k;RK2;",'linewidth',2,x,y4,"-k;RK4;",'linewidth',0.5)
%legend('location','north')
%grid on
plot(xe,ye,'-k','linewidth',0.5,x,y1,'--k','linewidth',2,x,y2,'-.k','linewidth',2,x,y4,'-k','linewidth',2)
ylim([0,1.25])
%legend('location','north')
%grid on
