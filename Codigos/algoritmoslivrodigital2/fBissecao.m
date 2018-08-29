function x=fBissecao(a,b,tol)
fa=f(a);
fb=f(b);
k = 0; %definição do intervalo inicial e do x medio inicial.
x = 0.5*(a+b);%x é o valor medio dentro do intervalo inicial
fx=f(x);
[k  a   x   b  fa fx fb];
%--------------------------------------------------------------------------------------------
dif = 1; 
while ( abs(fx)>eps && dif>tol && k<100 ) %Se f(x) é nulo, este laço não é executado
k = k + 1; %k indica a partição do intervalo: redefine a, b, e x. 
%--------------------------------------------------------------------------------------------
%Se |f(x)|->0 (abs(fx)<=1e-16) indica que a raiz x já foi atingida
%Senão
if (fa*fx<0) b=x;fb=fx;
else         a=x;fa=fx;
end%if
%aqui os valores de a e b estão redefinidos, pela partição k
%escolha do x medio, dentro do intervalo [a, b] atualizado:
x =0.5*(a+b);
fx=f(x);
[k  a   x   b  fa fx fb];
%---------------------------------------------------------------------------------------------
dif=abs(b-a);  %comprimento do intervalo [a, b] atualizado, particao k
end%while

printf("\n %da. particao:",k);
printf("\n a: %.16f",a);
printf("\n b: %.16f",b);
printf("\n x: %.16f - raiz encontrada",x);
printf("\n |b-a|: %.16f",dif);
printf("\n |f(x)|: %.16f \n",abs(fx));
end