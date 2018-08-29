clear
clc
a=0;b=pi;
n=16;
h=(b-a)/n;
xt=a:h:b;
x=cos(xt)
y=sqrt(1-x.^2);

% Interpola��o polinomial de Gregory Newton
difdiv1=fdifdiv(n,x,y); %vetor com diferen�as no ponto i = 1
np = 200; %N. de pontos para plotar os resultados aproximados
hp = (x(n+1)-x(1))/np;
xp = x(1):hp:x(n+1);
yip=fgregoryn(n,x,y,difdiv1,xp);

%3.  C�lculo por n Splines

%teremos 'n' splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem) 
a=[];b=[]; %zera memoria
%[a b c d]=fSplinea(n,x,y,h) % Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0
 [a b c d]=fSplineb(n,x,y); % Splines quadr�ticas NAS PONTAS da figura S1=S2 e Sn+1=Sn 
%[a b c d]=fSplined(n,x,y,h) % Splines extrapoladas NAS PONTAS da figura S1 e Sn+1
np=4;    % 4 sub-divis�es internas em cada n sub-intervalo entre x(i) e x(i+1) 
xpp=[];ypp=[];
for i=1:n
    xs=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
		ys(k)=a(i)*(xs(k)-x(i))*(xs(k)-x(i))*(xs(k)-x(i))+b(i)*(xs(k)-x(i))*(xs(k)-x(i))+c(i)*(xs(k)-x(i))+d(i);
	end
	xpp=[xpp xs];ypp=[ypp ys];
end

%plot(x,y,"x;f(x) = 'Contorno superior pato';", xp,yip,"r;P20(x) interpolador;")
%plot(x,y,'*k','markersize',20,xp,yip,"--k;P16(x) interpolador;",'LineWidth',1,xpp,ypp,"-k;m=16 Splines Cubicas;",'LineWidth',2)
plot(x,y,'*k','markersize',20,xp,yip,'--k','LineWidth',1,xpp,ypp,'-k','LineWidth',2)
ylim([0 1.35])