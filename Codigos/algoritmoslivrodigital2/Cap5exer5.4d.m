clear
clc
a=0;
b=pi/2;
n=2;	
h=(b-a)/n;
x=a:h:b
y=sin(x)
% Interpolação polinomial de Gregory Newton
difdiv1=fdifdiv(n,x,y) %vetor com diferenças no ponto i = 1
np = 100; %N. de pontos para plotar os resultados aproximados
hp = (x(n+1)-x(1))/np;
xp = x(1):hp:x(n+1);
ye = sin(xp); %valores exatos
yip=fgregoryn(n,x,y,difdiv1,xp); %y aproximado para cada xp(i)
erro=max(abs(yip.-ye))
plot(x,y,'k*','markersize',10,xp,yip,'--k','LineWidth',2,xp,ye,'-r','LineWidth',1)
legend('pontos tabelados','Pn(x) interpolador','f(x) exata','location','east')
xlim ([a b])
xlabel 'x'
ylabel 'y(x)'