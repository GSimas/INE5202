function a = fdetajustePn(n,m,x,y)
% Construcao do sistema do ajuste polinomial
neq = n+1 %N. de equacoes e incognitas
for i=1:neq
	for j=1:neq
		soma1 = 0;
		for k=1:m
			soma1 = soma1 + (x(k))^(i+j-2);
		end %k
		A(i,j)=soma1;
	end %j
	soma2 = 0;
	for k=1:m
		soma2 = soma2 + y(k)*(x(k))^(i-1);
	end %k
	b(i) = soma2;
end %i
[A transpose(b)];
a = fCholesky(neq,A,b);
end