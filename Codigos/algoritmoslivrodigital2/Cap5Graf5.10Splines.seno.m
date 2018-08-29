clear
clc
a=-pi;b=pi;
n=17;
h=(b-a)/n;
x=a:h:b;
y=sin(x);

% Interpolacao polinomial de Gregory Newton
difdiv1=fdifdiv(n,x,y) %vetor com diferencas no ponto i = 1
np = 500; %N. de pontos para plotar os resultados aproximados
hp = (x(n+1)-x(1))/np;
xp = x(1):hp:x(n+1);
%ye = log(xp); %valores exatos
for i = 1 : np+1
	yip(i)=fgregoryn(n,x,y,difdiv1,xp(i)); %y aproximado para cada xp(i)
end


%3.  Cclculo por n Splines

%teremos 'n' splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem) 
a=[];b=[]; %zera memoria
%[a b c d]=fSplinea(n,x,y,h) % Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0
 [a b c d]=fSplineb(n,x,y); % Splines quadraticas NAS PONTAS da figura S1=S2 e Sn+1=Sn 
%[a b c d]=fSplined(n,x,y,h) % Splines extrapoladas NAS PONTAS da figura S1 e Sn+1
np=4;    % 4 sub-divisoes internas em cada n sub-intervalo entre x(i) e x(i+1) 
xpp=[];ypp=[];
for i=1:n
    xs=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
		ys(k)=a(i)*(xs(k)-x(i))*(xs(k)-x(i))*(xs(k)-x(i))+b(i)*(xs(k)-x(i))*(xs(k)-x(i))+c(i)*(xs(k)-x(i))+d(i);
	end
	xpp=[xpp xs];ypp=[ypp ys];
end

plot(x,y,'*k',xp,yip,'--k',xpp,ypp,'-k','LineWidth',2) %P17(x) interpolador;m=17 Splines Cubicas;
%plot(x,y,'x',x,y,"k;f(x) = 'contorno superior pato';", xp,yip,"r;Pn(x) interpolador;",xpp,ypp,"g;n=20 Splines Cubicas;")
ylim([-1.35 1.35])