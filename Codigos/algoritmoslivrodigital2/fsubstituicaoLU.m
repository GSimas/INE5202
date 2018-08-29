function x=fsubstituicaoLU(n,A,b)
%L.c=b
c(1)=b(1)/A(1,1);
for i=2:n
soma=0;
	for j=1:i-1
	soma=soma+A(i,j)*c(j);
	end
    c(i)=(b(i)-soma)/A(i,i);
end
c
%U.x=c
x(n)=c(n);
for i=n-1:-1:1
soma=0;
	for j=i+1:n
	soma=soma+A(i,j)*x(j);
	end
x(i)=(c(i)-soma);
end
end