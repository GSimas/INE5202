function x=fGauss_Seidel1(n1,n2,x,fat,tol)
%Algoritmo especifico para exemplo 2.13
fat1=1-fat;

dif=1;iter=0;
while(dif>tol && iter<500)
	iter=iter+1;
%-----------------------------------------------------------------
	xi=x; % armazena valor inicial da solucao para calculo de dif
%A partir de xi definido, calcula-se um novo x melhorado.
% Neste exemplo optou-se por digitar diretametne as equações iterativas, mas 
% genericamente devemos tomar os dados, normalmente na forma matricial, definir 
% e usar apenas os coeficientes não nulos
	i=1;
		x(i)=fat1*xi(i)+fat*(0.1+x(i+1))/2;
	for i=2:n1-1
		x(i)=fat1*xi(i)+fat*(0.1+x(i-1)+x(i+1))/2.;
	end
	for i=n1:n2-1
		x(i)=fat1*xi(i)+fat*(0.2+x(i-2)+x(i-1))/2.;
	end
	i=n2;
		x(i)=fat1*xi(i)+fat*(0.3+x(i-1));	
%--------------------------------------------------------------
	dif=max(abs(x.-xi));
  x;
end
% saidas para aferir se convergiu:
iter
dif
end