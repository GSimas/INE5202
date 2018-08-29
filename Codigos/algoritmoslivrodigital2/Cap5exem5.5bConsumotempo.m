clear
clc
%5.5b)
n=4
tempo  =[	85 89	  93	95	96	]
Consumo=[	5	 5.7	6.2	6.7	7.0	]
difdiv1=fdifdiv(n,tempo,Consumo)

xp=tempo(1):0.01:102;
yp=fgregoryn(n,tempo,Consumo,difdiv1,xp);
plot(tempo,Consumo,'*k','markersize',20,xp,yp,'-k','LineWidth',2,[85 97.64],[7.5 7.5],'--k','LineWidth',2,[97.64 97.64],[5 7.5],'--k','LineWidth',2)
xlabel 'tempo(anos)'
ylabel 'Consumo(MW)'
xlim ([85 102])
grid on
