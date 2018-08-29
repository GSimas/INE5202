clear
clc
format long
%limites da integral
a=0
b=1
I=exp(b)-exp(a) %Integral exata, p validação do algoritmo
%metodo dos trapezios
n=4; %espaçamento inicial para definir h=(b-a)/n=0.25
k=5 %N. de aproximaçoes iniciais em j=1
for i=1:k
  Tn(i,1)=fTn(n,a,b);
  n=n*2;
end
for j=2:k
  for i=j:k
   Tn(i,j)=(4^(j-1)*Tn(i,j-1)-Tn(i-1,j-1))/(4^(j-1)-1);
  end
end
Tn
ErroTn=abs(Tn(5,4)-I)