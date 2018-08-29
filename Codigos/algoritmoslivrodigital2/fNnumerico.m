function x=fNnumerico(xi,tol)%Método de newton:
dx=1e-6*xi; %valor iniciais de dx
dif = 1; k = 0;
while (dif>tol && k<100)
k = k + 1; % passo k iterativo
%-----------------------------------------------
%Calculo de um novo x, melhorado em relação a xi
	fxi   = f1(xi);
	fxidx = f1(xi+dx);
	dfnum = (fxidx-fxi)/dx;%derivada aproximada numericamente
	dx = -fxi/dfnum;
	x  = xi+dx;
	dif = abs(dx);
  [xi  fxi  fxidx  dfnum  dx  x  dif];
   xi = x;
%-----------------------------------------------
% xi redefinido
end
printf("\n %da. iteracao:",k);
printf("\n x: %.16f - raiz encontrada",x);
printf("\n |x-xi|: %.16f",dif);
printf("\n |f(x)|: %.16f",abs(f1(x)));
end