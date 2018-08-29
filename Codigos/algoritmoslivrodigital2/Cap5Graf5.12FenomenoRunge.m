clear
clc
% Neste exemplo usaremos a interpolação para demonstrar o fenomeno de Runge:
%1. Polinomial com m pontos equidistantes;
%2. Polinomial com mk pontos definidos pelos 'nós' do polinomio de grau nk=mk-1 de Chebyschev;
%3. Por polinomiais splines cubicas.
clear
a=-1 %valor inicial do intervalo
b=+1 %valor final   do intervalo

%1.Polinomial com pontos equidistantes;
n=16 %numero de subdivicoes do intervalo [a; b] para n+1 pontos
m=n+1;
x=a:((b-a)/n):b;    % valores de x equidistantes
y=1./(1.+25.*x.*x); % valores exatos da função f(x) para os n+1 pontos tabelados
% Cálculo por interpolação polinomial
difdiv1=fdifdiv(n,x,y); %vetor com diferenças de ordem k=1:n no ponto i = 1 
np=10*n % numero de subdivicoes para serem plotados
xp= a:((b-a)/np):b; % (np+1) pontos x a serem plotados
yp=fgregoryn(n,x,y,difdiv1,xp); %y aproximado por Pn(x) para cada xp(i)
ye=1./(1.+25.*xp.*xp); %valores exatos de y
erroPnequid=max(abs(yp.-ye))

%2. Polinomial com m pontos definidos pelas 'nós' do polinomio de grau nk de Chebyshev;
nk=n
mk=m; % 17 nós de Chebyschev, polinomio de grau nk=16
for i=1:mk
	  ang=(2*(mk-i+1)-1)/mk*(pi/2); %distribuição de angulo entre 0 e pi (decresecentes).
    xk(i)=0.5*(b+a)+0.5*(b-a)*cos(ang); %'nos' de Chebyschev 
	  yk(i)=1/(1+25*xk(i)*xk(i)); %valores exatos de y
end%for
%plot(x,0,"o", tk,1,"x",0,2,0,-1)
% Cálculo por interpolação polinomial
difdiv1=fdifdiv(nk,xk,yk); %vetor com diferenças no ponto i = 1 
ypk=fgregoryn(nk,xk,yk,difdiv1,xp); % (np+1) pontos y a serem plotados
yek=1./(1.+25.*xp.*xp);
erroPncheb=max(abs(ypk.-yek))

%3.  Cálculo por n Splines
%teremos 'n' splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem) 
a=[];b=[]; %zera memoria
%[a b c d]=fSplinea(n,x,y) % Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0
 [a b c d]=fSplineb(n,x,y); % Splines quadráticas NAS PONTAS da figura S1=S2 e Sn+1=Sn 
%[a b c d]=fSplined(n,x,y) % Splines extrapoladas NAS PONTAS da figura S1 e Sn+1
np=8;    % 8 sub-divisões internas em cada n sub-intervalo entre x(i) e x(i+1) 
xpp=[];ypp=[];
for i=1:n
    xs=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
		ys(k)=a(i)*(xs(k)-x(i))*(xs(k)-x(i))*(xs(k)-x(i))+b(i)*(xs(k)-x(i))*(xs(k)-x(i))+c(i)*(xs(k)-x(i))+d(i);
	end
	xpp=[xpp xs];ypp=[ypp ys];
end
yep=1./(1.+25.*xpp.*xpp);

erroSpline=max(abs(ypp.-yep))

%plot(xp,yp,"-.k;Interpolacao com nos equidistantes n=16;",'LineWidth',2,xk,yk,'*k','markersize',10,xp,ypk,"-k;Interpolacao sobre m=16+1 'nos' de Chebyshev *;",'LineWidth',3,xpp,ypp,"-k;n=16 Splines Cubicas;",'LineWidth',1)
plot(xp,yp,'-k','LineWidth',0,xk,yk,'ok','markersize',10,xp,ypk,'-k','LineWidth',3,xpp,ypp,'--k','LineWidth',1)
legend()
ylim([-0.2 1.3])
