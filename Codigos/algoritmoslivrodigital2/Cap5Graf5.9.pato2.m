clear
clc
x=[0.9 1.3 1.95 2.15 2.65 3.0 3.90 4.4 4.70 5.00 6.00 7.0 8.0 9.20 10.5 11.3 11.6 12.0 12.7 13.0 13.4];
y=[1.2 1.4 1.85 2.10 2.60 2.7 2.35 2.2 2.05 2.15 2.25 2.3 2.3 1.95 1.40 0.85  0.7  0.6  0.5  0.4  0.3];
n=length(x)-1

% Interpolação polinomial de Gregory Newton
difdiv1=fdifdiv(n,x,y); %vetor com diferenças no ponto i = 1
np = 500; %N. de pontos para plotar os resultados aproximados
hp = (x(n+1)-x(1))/np;
xp = x(1):hp:x(n+1);
%ye = log(xp); %valores exatos
for i = 1 : np+1
	yip(i)=fgregoryn(n,x,y,difdiv1,xp(i)); %y aproximado para cada xp(i)
end


%3.  Cálculo por n Splines
for i=1:n	
	h(i)=x(i+1)-x(i);
end
h;
%teremos 'n' splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem) 
a=[];b=[]; %zera memoria
%[a b c d]=fSplinea(n,x,y,h) % Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0
 [a b c d]=fSplineb(n,x,y,h); % Splines quadráticas NAS PONTAS da figura S1=S2 e Sn+1=Sn 
%[a b c d]=fSplined(n,x,y,h) % Splines extrapoladas NAS PONTAS da figura S1 e Sn+1
np=4;    % 4 sub-divisões internas em cada n sub-intervalo entre x(i) e x(i+1) 
xpp=[];ypp=[];
for i=1:n
    xs=x(i):h(i)/np:x(i+1);
	for k=1:np+1
		ys(k)=a(i)*(xs(k)-x(i))*(xs(k)-x(i))*(xs(k)-x(i))+b(i)*(xs(k)-x(i))*(xs(k)-x(i))+c(i)*(xs(k)-x(i))+d(i);
	end
	xpp=[xpp xs];ypp=[ypp ys];
end

%plot(x,y,"x;f(x) = 'Contorno superior pato';", xp,yip,"r;P20(x) interpolador;")
plot(x,y,'*k',xp,yip,'--k',xpp,ypp,'-k','LineWidth',2)%;P20(x) interpolador;;m=20 Splines Cubicas;
%plot(x,y,'x',x,y,"k;f(x) = 'contorno superior pato';", xp,yip,"r;Pn(x) interpolador;",xpp,ypp,"g;n=20 Splines Cubicas;")
ylim([-4 8])
%legend('location','north')