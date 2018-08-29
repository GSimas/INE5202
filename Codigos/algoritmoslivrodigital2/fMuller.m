function x=fMuller(x0,tol)
% 3 valores iniciais de x
x1 = x0*0.99;
x2 = x0*0.98;
dif = 1; k = 0;
while ( dif>tol && k<200 )
k = k + 1; % passo k iterativo
%-----------------------------------------
  q=(x0-x1)/(x1-x2);
  a=q*f2(x0)-q*(1+q)*f2(x1)+q*q*f2(x2);
  b=(2*q+1)*f2(x0)-(1+q)*(1+q)*f2(x1)+q*q*f2(x2);
  c=(1+q)*f2(x0);
  x=x0-(x0-x1)*(2*c/( b+sign(b)*sqrt(b*b-4*a*c) ));
  dif=abs(x.-x0); %+abs(f(x))
[k  x2 x1 x0 x dif ];
%Seleção dos 3 melhores valores de x disponiveis: x1 x0 x
  x2 = x1; %Valor original de x2 é descartado e é substituido por x1
  x1 = x0; %Valor original de x1 é  substituido por x0
  x0 = x;  %Valor original de x0 é  substituido por x calculado (melhor valor disponivel)  
%-----------------------------------------
end
k
dif
end