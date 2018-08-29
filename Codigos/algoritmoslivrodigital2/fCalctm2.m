function t=fCalctm2(m)
%t(m,k) = Zeros dos Polinomios de Legendre de grau k=1 ate m (GENERICO)
t=zeros(m, m);
a=zeros(m+1, m+1);

n=1;
  a(n,1)=0;a(n,2)=1;    %p1=0+1x
  aux = sort(transpose(roots(fliplr(a(n,1:n+1)))));
  for k=1:n t(n,k)=aux(k); end

n=2;
  a(n,1)=-1/2;a(n,2)=0;a(n,3)=3/2;%p2=-1+0x+3x^2
  aux = sort(transpose(roots(fliplr(a(n,1:n+1)))));
  for k=1:n t(n,k)=aux(k); end

for n=3:m
  k=0;  a(n,k+1)=(1-n)/n*a(n-2,k+1);
  for k=1:n-2 %k=1,2,...n-2
    a(n,k+1)=(1-n)/n*a(n-2,k+1)+(2*n-1)/n*a(n-1,k-1+1); 
  end
  k=n-1;  a(n,k+1)=(2*n-1)/n*a(n-1,k);
  k=n;    a(n,k+1)=(2*n-1)/n*a(n-1,k+1-1);
  aux = sort(transpose(roots(fliplr(a(n,1:n+1)))));
  for k=1:n t(n,k)=aux(k); end
end

%recorrencia a partir de P(n) e P(n-1) conhecidos
% (n+1)*P(n+1)-(2n+1)*x*P(n)+n*P(n-1)=0 
% P(n+1)=((2n+1)*x*P(n)-n*P(n-1))/(n+1)
end
