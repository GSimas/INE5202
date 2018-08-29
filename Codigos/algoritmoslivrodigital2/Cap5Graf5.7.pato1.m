clear
clc
x=[0.9 1.3 1.9 2.2 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.3 10.5 11.3 11.6 12.0 12.6 13.0 13.4];
y=[1.2 1.3 1.9 2.2 2.6 2.7 2.4 2.2 2.0 2.1 2.2 2.3 2.3 1.9  1.4  0.9  0.7  0.6  0.5  0.4  0.3];
n=length(x)-1

% Interpolação polinomial de Gregory Newton
difdiv1=fdifdiv(n,x,y); %vetor com diferenças no ponto i = 1
np = 1000; %N. de pontos para plotar os resultados aproximados
hp = (x(n+1)-x(1))/np;
xp = x(1):hp:x(n+1);
%ye = log(xp); %valores exatos
yip=fgregoryn(n,x,y,difdiv1,xp); %y aproximado para cada xp(i)
plot(x,y,'*k',x,y,'--k', xp,yip,'-k','LineWidth',2) %f(x) = 'contorno superior pato';Pn(x) interpolador;"
ylim([-4 8])