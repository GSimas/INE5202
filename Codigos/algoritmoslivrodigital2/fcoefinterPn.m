function C=fcoefinterPn(n,x,y)
tsis = n+1; %numero de equacoes do sistema
%forma não otimizada: usando a eq.(4)
%for i = 1 : tsis
%	for j = 1 : tsis
%		A(i,j) = x(i)^((n+1)-j); % lei de formação genérica
%	end%for
%	A(i, tsis+1) = y(i);
%end%for
%forma otimizada de obter a matriz do sistema daod pela eq. (3)
for i = 1 : tsis
	A(i,1) = 1.;
	for j = 2:tsis
		A(i,j) = A(i,j-1)*x(i);
	end%j
	A(i, tsis+1) = y(i);
end%i
A;
C = fgausspivparcial(tsis,A); % coeficientes do polinomio interpolador
end