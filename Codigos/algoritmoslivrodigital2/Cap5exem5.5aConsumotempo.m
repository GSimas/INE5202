clear
clc
%5.5a)
n=4
Consumo=[	5	 5.7	6.2	6.7	7.0	]
tempo  =[	85 89	  93	95	96	]
difdiv1=fdifdiv(n,Consumo,tempo)
Consumo1=7.5
tempo1=fgregoryn(n,Consumo,tempo,difdiv1,Consumo1)
xp=Consumo(1):0.01:7.5;
yp=fgregoryn(n,Consumo,tempo,difdiv1,xp);
plot(Consumo,tempo,'*k','markersize',20,xp,yp,'k','LineWidth',2,[5 7.5],[101.37 101.37],'--k','LineWidth',2)
xlabel 'Consumo de energia(MW)'
ylabel 'tempo(anos)'
grid on

