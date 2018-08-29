function x=fFalsaposicao(a,b,tol)
%Algoritmo Falsa Posição:
  k=0;
	fa=f(a);
	fb=f(b);
	x =a-fa*(b-a)/(fb-fa); %x é o valor dentro do intervalo inicial
	fx=f(x);
	[k  a   x   b  fa fx fb];
%---------------------------------------------------------------------------------------
dif = 1;xi=x;
while ( abs(fx)>eps && dif>tol && k<100 ) %Se f(x) é nulo, este laço não é executado
	k = k + 1; %k indica a partição do intervalo: redefine a, b, e x.
%---------------------------------------------------------------------------------------
   %Se |f(x)|->0 (abs(fx)<=1e-16) indica que a raiz x já foi atingida
%Senão
	if (fa*fx<0) b=x;fb=fx;
	else         a=x;fa=fx;
	end%if
	%aqui os valores de a e b estão redefinidos
	%valor x dentro do intervalo [a, b] atualizado:
	x =a-fa*(b-a)/(fb-fa); %x é o valor dentro do intervalo particionado
	fx=f(x);
	dif=abs(x-xi);  %diferença entre valores médios sucessivos e valor de f(x)
	[k  a   x   b  fa fx fb dif];
%---------------------------------------------------------------------------------------
	xi=x;
end%while
printf("\n %da. particao:",k);
printf("\n a: %.16f",a);
printf("\n b: %.16f",b);
printf("\n x: %.16f - raiz encontrada",x);
printf("\n |x-xi|: %.16f",dif);
printf("\n |f(x)|: %.16f \n",abs(fx));
end