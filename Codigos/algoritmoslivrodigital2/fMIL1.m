function x=fMIL1(xi,tol)%Método da Iteração Linear:
dif = 1; k = 0; fator=0.5%fator de sub-relaxação
fator1=1-fator;
while ( dif>tol && k<1000 )
k = k + 1; % passo k iterativo
%-----------------------------------------
%x=exp(3.2/xi);
x= fator1*xi+fator*(3.2/log(xi));%especifico para f1(x)=x*ln(x)-3.2;
dif=abs(x.-xi);
[k x dif abs(f1(x))];
xi = x; %Valor de xi redefinido, melhorado, então repete-se o passo k 
%-----------------------------------------
end
printf("%da. iteracao:",k);
printf("\n x: %.16f - raiz encontrada",x);
printf("\n |x-xi|: %.16f",dif);
printf("\n |f(x)|: %.16f",abs(f1(x)));
end