format long
clear
clc
a=0;
b=pi/2;
n=1; %valor inicial de n
erromax=1;
while (erromax>sqrt(10)*1e-6) %O(1e-6)
	n=n+1
	h=(b-a)/n;
	x=a:h:b;
	y=cos(x);
	% Interpolação polinomial de Gregory Newton
	difdiv1=fdifdiv(n,x,y); %vetor com diferenças no ponto i = 1
	np = 40*n; %N. de pontos para plotar os resultados aproximados
	hp = (x(n+1)-x(1))/np;
	xp = x(1):hp:x(n+1);
	ye = cos(xp); %valores exatos
	yip=fgregoryn(n,x,y,difdiv1,xp); %y aproximado para cada xp(i)
	erro=abs(yip.-ye);
	erromax=max(erro)
end
plot(xp,erro,'--k','LineWidth',2)
legend('Erro entre Pn(x) e f(x)',' ','location','north')
xlim ([a b])
xlabel 'x'
ylabel 'Erro(x)'