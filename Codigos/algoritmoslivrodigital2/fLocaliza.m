function xi= fLocaliza(n,coef)
%localiza raizes Reais xR e Complexas xC
%Cota do Modulo máximo
rmax(1)=fmodmax(n,coef);
rmin(1)=1./fmodmax(n,fliplr(coef));% fliplr(coef) retorna uma copia de 'coef' em ordem reversa
%Cota Cauchy
rmax(2)=fcauchy(n,coef);
rmin(2)=1./fcauchy(n,fliplr(coef));% fliplr(coef) retorna uma copia de 'coef' em ordem reversa
%Cota Kojima
rmax(3)=fkojima(n,coef);
rmin(3)=1/fkojima(n,fliplr(coef));% fliplr(coef) retorna uma copia de 'coef' em ordem reversa
%valores limites para raizes iniciais reais e complexas dentro das cotas minimas [Rmin,Rmax]:
Rmin=max(rmin)
Rmax=min(rmax)

if abs(Rmin-Rmax)<1e-15 Rmin=0.99*Rmin; Rmax=1.01*Rmax; end %Caso Rmin e RMax sejam iguais

%Varredura de x REAIS para polinomios de coef. REAIS:
complexo=fcomplexo(n,coef); %se complexo==1 existem coeficientes complexos
%indice da raiz real iR
iR = 0;
xR=[]; %conjunto inicial vazio
if complexo==0    %se complexo==0 só existem coeficientes reais e a varredura é executada
	Nh=round((Rmax-Rmin)*n)*10; % Numero de Nh subintervalos para varredura 
	h=(Rmax-Rmin)/Nh; %define-se Nh subintervalos entre [-Rmax,-Rmin] e Nh entre [Rmin,Rmax]
	% varredura em Nh subintervalos entre [-Rmax,-Rmin]
	a = -Rmax-1e-8; %varredura inicia antes do min, para capturar raiz=-Rmax
	b = a + h;
	while ( b < -Rmin+h )
		%
		fa=fPnH1(n,coef,a);
		fb=fPnH1(n,coef,b);
		if ( fa*fb<=0 )
			iR = iR + 1;	
			xR(iR)=0.5*(a+b);	
		end
	% define novo subintervalo de teste
		a = b;
		b = a + h;
	end
	% varredura em Nh subintervalos entre [+Rmin,+Rmax]
	a = Rmin-1e-8;
	b = a + h;
	while ( b < Rmax+h )
		%
		fa=fPnH1(n,coef,a);
		fb=fPnH1(n,coef,b);
		if ( fa*fb<=0 )
			iR = iR + 1;	
			xR(iR)=0.5*(a+b);	
		end
	% define novo subintervalo de teste
		a = b;
		b = a + h;
	end
	if iR>n % em caso de multiplicidades M elevadas, xR pode, erroneamente, passar de n, então são tomadas as primeiras raizes reais 
	   iR=n;
	   xR=xR(1:iR);
	end
end %if complexo==0
iC=0;
xC=[]; %conjunto inicial vazio
for i=iR+1:n
    iC=iC+1;
	rx=sign(unifrnd(-1,1))*unifrnd(Rmin,Rmax)*sqrt(2)*0.5; % ditribuição randomica, do sinal e do modulo da componente real
	ry=sign(unifrnd(-1,1))*unifrnd(Rmin,Rmax)*sqrt(2)*0.5; % ditribuição randomica, do sinal e do modulo da componente imaginaria
	xC(iC)=complex(rx,ry); % raizes complexas iniciais remanescentes, dentro do intervalo [rmin,rmax]
end
xi=[xR xC];
end