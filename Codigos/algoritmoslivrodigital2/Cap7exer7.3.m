clear
clc
m=7;
x=[ 13.9	37.0	67.8	79.0	85.5	93.1	99.2]
y=[ 1.04	1.18	1.29	1.35	1.28	1.21	1.06]
% estrutura (plotagem) da funcao ajustadora
np = 10*m
xp = x(1):(x(m)-x(1))/np:x(m);

% Ajuste polinomial para determinação de coeficientes
n1 = 1 % grau do polinomio ajustador (definido pela forma do grafico)
a1 = fdetajustePn(n1,m,x,y)
ypajuste1=fPnH(n1,a1,xp);

n2 = 2 % grau do polinomio ajustador (definido pela forma do grafico)
a2 = fdetajustePn(n2,m,x,y)
ypajuste2=fPnH(n2,a2,xp);

%Interpolação polinomial de grau n=m-1=5
n=m-1
difdiv1=fdifdiv(n,x,y) %vetor com diferenças no ponto i = 1	ye = sin(xp); %valores exatos
ypinter=fgregoryn(n,x,y,difdiv1,xp); %y interpolado para cada xp(i)

plot(x,y,'*','markersize',20,xp,ypajuste1,'--b','LineWidth',2,xp,ypajuste2,'-k','LineWidth',2,xp,ypinter,'.r','LineWidth',1)
legend('Dados experimentais','P1(x) funcao ajustada polinomial n=1','P2(x) funcao ajustada polinomial n=2','P6(x) funcao interpolada n=6','location','north')
grid on
