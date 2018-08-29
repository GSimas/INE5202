clear
clc
m=5;%Numero de pontos experimentais 
n=4
%
x=[ 1 3	4	6	8 ]
y=[ 0 1	2	4	5 ]
xinicial=x(1)
xfinal  =x(m)
np= 64;                     % Numero de intervalos para analise e plotagem
hp=(xfinal-xinicial)/np;    % Valor espaçamento de cada intervalo para plotagem
xp=xinicial:hp:xfinal;      % Valores dos 'np+1' pontos xp(k) (k=1:np+1) 
%
% Aproximação de função por Ajuste de curvas (INDICADA PARA PONTOS EXPERIMENTAIS)
%
for i=1:m
  ya(i,:) = fL1(n,x,i,xp);
end

%plot(x,0,'*','markersize',20,xp,ya(1,:),'-b','LineWidth',2,xp,ya(3,:),'..k','LineWidth',2,xp,ya(m,:),'--r','LineWidth',2)% Plotagem dos pontos originais (*) e ajustadores
%legend('funcao peso em x(1)','funcao peso em x(3)','funcao peso em x(5)','location','north')
x0=[ 1 3	6	8 ]
plot(x0,0,'bk','markersize',20,x(3),1,'bk','markersize',20,xp,ya(3,:),'-k;','LineWidth',2,[1 8],[0 0],'k',[1 8],[1 1],'k')% Plotagem dos pontos originais (*) e ajustadores (funcao peso em x(3)=4;)
grid on