clear
clc
x=[	  0	  1	  2	  3 ]
y=[	 -3	 -2	  4	  0 ]
n=length(x)-1
%3.  Cálculo por n Splines
%teremos 'n' splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem) 
a=[];b=[]; %zera memoria
  [a b c d]=fSplineb(n,x,y) % Splines quadráticas NAS PONTAS da figura S1=S2 e Sn+1=Sn
np=16;    %4 sub-divisões para cada sub-intervalo entre x(i) e x(i+1) para plotagem
xpp=[];ypp=[];
for i=1:n
    xp=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
	    yp(k)=a(i)*(xp(k)-x(i))*(xp(k)-x(i))*(xp(k)-x(i))+b(i)*(xp(k)-x(i))*(xp(k)-x(i))+c(i)*(xp(k)-x(i))+d(i);
	end
	xpp=[xpp xp];ypp=[ypp yp];
end
plot(x,y,'*k','markersize',10,xpp,ypp,'-k','LineWidth',2)
