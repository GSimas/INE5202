function x=fNSecante(xi,tol)%Método de newton:
dx=1e-6*xi; %valor iniciais de dx
dif = 1; k = 0;
x1=xi;  fi=f1(x1);
x2=xi+dx;
while (dif>tol && k<100)
k = k + 1; % passo k iterativo
%-----------------------------------------------
%Calculo de um novo x, melhorado em relação a xi
	f2 = f1(x2); %função de x é calculada uma unica vez
	x  = (x1*f2-x2*fi)/(f2-fi);
	dif = abs(x2-x1);
  [x2  f2  dif];
  x1=x2;fi=f2;%Atualiza valores anteriores
  x2=x; 
%-----------------------------------------------
% xi redefinido
end
printf("\n %da. iteracao:",k);
printf("\n x: %.16f - raiz encontrada",x);
printf("\n |x-xi|: %.16f",dif);
printf("\n |f(x)|: %.16f",abs(f1(x)));
end