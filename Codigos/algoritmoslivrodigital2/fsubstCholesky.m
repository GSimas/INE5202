function x=fsubstCholesky(n,L,b)
%L.C=b
c(1)=b(1)/L(1,1);
for i=2:n
soma=0;
	for j=1:i-1
	soma=soma+L(i,j)*c(j);
	end
    c(i)=(b(i)-soma)/L(i,i);
end
%U*X=c -> Lt*X=C
x(n)=c(n)/L(n,n);
for i=n-1:-1:1
soma=0;
	for j=i+1:n
	soma=soma+L(j,i)*x(j);%Note o uso da matriz U=transposta de L
	end
    x(i)=(c(i)-soma)/L(i,i);
end
end
