% Represente uma funcao parametrizada em t
a= 0 %valor inicial do intervalo t
b=+1. %valor final do intervalo t

m=3 %numero de subdivicoes do intervalo [a ; b] para m+1 pontos discretos em *
t=a:(b-a)/m:b %variavel auxiliar
x=0.+3.*(t.-0).-3.*(t.-0).*(3.*t-1).+(t.-0).*(3.*t.-1).*(3.*t.-2); 
y=1.-(3./2).*(t.-0); 

m=2^8 %numero de subdivicoes do intervalo [a ; b] para plotar em linha continua
t=a:(b-a)/m:b; %variavel auxiliar
x2=0.+3.*(t.-0).-3.*(t.-0).*(3.*t-1).+(t.-0).*(3.*t.-1).*(3.*t.-2);  
y2=1.-(3./2).*(t.-0);   
plot(x2,y2,'-k','linewidth',2, x,y,'*k','markersize',20)
grid