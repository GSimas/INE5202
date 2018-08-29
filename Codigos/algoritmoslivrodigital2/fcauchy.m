function raio=fcauchy(n,a)
%Calcula o máximo modulo de todas as raízes pela Cota de Cauchy
xi=0.;
dif=1;k=0;
while ( dif>1e-14 && k<50 )
k=k+1;
%----------------------------------------------
	soma=0;
	for i=2:n+1
		soma=soma+abs(a(i))*xi^(n-i+1);
	end
	x=(soma/abs(a(1)))^(1/n);
	dif=abs(x-xi);
	xi=x;
%----------------------------------------------	
	raio=x;
end
end #function