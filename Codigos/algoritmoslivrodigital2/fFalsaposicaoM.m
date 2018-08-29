function x=fFalsaposicaoM(a,b,tol)
%Algoritmo Falsa-Posição modificado:
k = 0; %definição do intervalo e x medio iniciais.
%-----------------------------------------------------------------------
	fa=f(a);
	fb=f(b);
	x =a-fa*(b-a)/(fb-fa);xi=x;%x é o valor dentro do intervalo inicial Falsa-Posicao
	fx=f(x);
	[k  a   x   b  fa fx fb];
%-----------------------------------------------------------------------
dif = 1;
while ( abs(fx)>eps && dif>tol && k<100 ) %Se f(x) é nulo, este laço não é executado
	k = k + 1; %k indica a partição do intervalo: redefine a, b, e x.
%-----------------------------------------------------------------------
    %Se |f(x)|->0 (f(x)<=1e-16) indica que a raiz já foi atingida
	%Senão
    if (fa*fx<0) pa=fb/(fb+fx);%redução aplicada sobre o valor da função no ponto fixo 'a'
	         fa=fa*pa; b=x; fb=fx;%função fa no ponto fixo 'a' foi reduzida pelo fator pa
    else        pb=fa/(fa+fx);%redução aplicada sobre o valor da função no ponto fixo 'b' 
	        fb=fb*pb; a=x; fa=fx;%função fb no ponto fixo 'b' foi reduzida pelo fator pb
    end%if
	x =a-fa*(b-a)/(fb-fa); %x é o valor dentro do intervalo inicial
	fx=f(x);               %atualiza f(x), para usar depois
	dif=abs(x-xi); %diferença entre partições sucessivas e valor da função em x
  xi=x;
[k  a   x   b  fa fx fb dif];
%-----------------------------------------------------------------------
end%while
printf("\n %da. particao:",k);
printf("\n a: %.16f",a);
printf("\n b: %.16f",b);
printf("\n x: %.16f - raiz encontrada",x);
printf("\n |x-xi|: %.16f",dif);
printf("\n |f(x)|: %.16f \n",abs(fx));
end%function
