clear
clc
m=5;%Numero de pontos experimentais 
x=[1	  3	  4	  5   6 ]
y=[2.5	8	  13	22  40]
x=x;      %variavel permaneceu
z=log(y) %variavel transformada

xinicial=x(1)
xfinal  =x(m)
np= 64;                     % Numero de intervalos para analise e plotagem
hp=(xfinal-xinicial)/np;    % Valor espaçamento de cada intervalo para plotagem
xp=xinicial:hp:xfinal;      % Valores dos 'np+1' pontos xp(k) (k=1:np+1) 
%
% Aproximação de função por Ajuste de curvas (INDICADA PARA PONTOS EXPERIMENTAIS)
%
n1=1   % Ajuste a um polinomio de 1. grau, escolhido em função de seu comportamento grafico;
coef1=fdetajustePn(n1,m,x,z)
a=exp(coef1(1))
b=exp(coef1(2))
%desvio
D=0;
for k=1:m
	D=D+((a*b^x(k))-y(k))^2;
end%for
D=D/m

%coef. determinação, valor médio
ym=0;    for k=1:m ym=ym+y(k);                  end 
ym=ym/m;
soma1=0; for k=1:m soma1=soma1+(a*b^x(k)-ym)^2; end
soma2=0; for k=1:m soma2=soma2+(y(k)    -ym)^2; end
R2=soma1/soma2

ya1=a.*b.^xp; % Calculo dos valores da função ajustada em todos os xp
plot(x,y,'*k','markersize',20,xp,ya1,'-k','LineWidth',2)% Plotagem dos pontos originais (*) e ajustadores
%legend('f(x) tabelada','Ajuste a Exponencial ','location','north')
%grid on