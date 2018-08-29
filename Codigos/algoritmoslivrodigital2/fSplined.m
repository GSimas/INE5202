function [a b c d]=fSplined(m,x,y)
%teremos 'm' splines cúbicas, uma para cada intervalo, formando um sistema tridiagonal de 'm-1' equacoes para S (derivadas de segunda ordem) 
for i=1:m
	h(i)=x(i+1)-x(i);
end
% Splines extrapoladas NAS PONTAS da figura S1 e Sm+1
%1a. eq. i=1
t(1)=0; r(1)=h(2); d(1)=-(h(1)+h(2)); b(1)=0; %para S1 %tem-se um coeficiente extra aux1=h(1)*S(3)
for i=2:m
 t(i)=h(i-1);r(i)=2*(h(i-1)+h(i));d(i)=h(i);b(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));%para Si
end%for
%ultima eq. i=m+1%
t(m+1)=-(h(m-1)+h(m));r(m+1)=h(m-1);d(m+1)=0;b(m+1)=0; %para Sm %tem-se um coeficiente extra aux2=h(m)*S(m-1)
%Sistemas de eqs. tridiagonal nas  eqs. de i=2 a m, termos extras p/ i=1, tem-se aux1, e p/ i=m+1, tem-se aux2
for i=2:m
    aux=t(i)/r(i-1);t(i)=0;
    r(i)=r(i)-aux*d(i-1);
	b(i)=b(i)-aux*b(i-1);
end
%alterar o coeficiente extra da ultima linha i=m+1 -> aux2=h(m)*S(m-1), usando alinha i=m-1
i=m+1;
    aux=h(m)/r(m-1); %aux2=0; %zerado com a linha L(i-2=m-1)
    t(i)=t(i)-aux*d(i-2);
    r(i)=r(i)-aux*0;
	b(i)=b(i)-aux*b(i-2);
%alterar a ultima linha tridiagonal i=m+1
i=m+1
    aux=t(i)/r(i-1);t(i)=0;
    r(i)=r(i)-aux*d(i-1);
    b(i)=b(i)-aux*b(i-1);
%Retrosubstituição: a partir da ultima linha i=m+1
S(m+1)=b(m+1)/r(m+1);
for i=m:-1:2
  S(i)=(b(i)-d(i)*S(i+1))/r(i);
end
% primeira linha tem um termo extra aux1=h(1)*S(3):
i=1;
  S(i)=(b(i)-d(i)*S(i+1)-h(1)*S(3))/r(i);
% Splines extrapoladas NAS PONTAS da figura S1 e Sm+1
% Calcula-se cada conjunto de coeficientes a, b, c, d dos polinomios de 3o. grau
a=[];b=[];c=[];d=[];%zera memoria
for i=1:m
	a(i)=(S(i+1)-S(i))/(6*h(i));
	b(i)= S(i)/2;
	c(i)=(y(i+1)-y(i))/h(i)-(S(i+1)+2*S(i))*h(i)/6;
	d(i)= y(i);
end
end