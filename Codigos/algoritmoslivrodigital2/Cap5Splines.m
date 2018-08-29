clear
clc
% Algoritmo de interpolação por Splines cúbicas:
% Represente a funçao f(x)=x^3-3 com x  entre 0 e 4, de forma continua e suave
a=0 %valor inicial do intervalo
b=4 %valor final do intervalo
n=4 %numero de subdivisões do intervalo [a, b] para n+1 pontos
x=a:(b-a)/n:b;
y=f4(x); % valores exatos da função f1 = x.^3.-3  para os n+1 pontos tabelados
a=[];b=[]; %zera memoria
%[a b c d]=fSplinea(n,x,y) % Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0
%[a b c d]=fSplineb(n,x,y) % Splines quadráticas NAS PONTAS da figura S1=S2 e Sn+1=Sn 
% u=0;v=24;  %valores exatos da função f" = 3.*x  em x=a e em x=b
%[a b c d]=fSplinec(n,x,y,u,v) % Splines de extremos definidos NAS PONTAS da figura S1=u e Sn+1=v 
[a b c d]=fSplined(n,x,y) % Splines extrapoladas NAS PONTAS da figura S1 e Sn+1, a partir de valores internos
np=4;    %4 sub-divisões para cada sub-intervalo entre x(i) e x(i+1) para plotagem
xpp=[];ypp=[];
for i=1:n
    xp=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
	   yp(k)=a(i)*(xp(k)-x(i))*(xp(k)-x(i))*(xp(k)-x(i))+b(i)*(xp(k)-x(i))*(xp(k)-x(i))+c(i)*(xp(k)-x(i))+d(i);
	end
	xpp=[xpp xp];ypp=[ypp yp];
end
%i=3
%teste=a(i)*(2.5-x(i))*(2.5-x(i))*(2.5-x(i))+b(i)*(2.5-x(i))*(2.5-x(i))+c(i)*(2.5-x(i))+d(i)
plot(x,y,'*',xpp,ypp,'k',5,0)