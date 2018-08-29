function x=fLUCholesky(n,A,b)
	k=1;
	L(1,1)=sqrt(A(1,1));
	for i=2:n
		L(i,1)=A(i,1)/L(1,1);
	end%for
	for k=2:n-1
		soma=0;
		for r=1:k-1
			soma=soma+L(k,r)*L(k,r);
		endfor %r
		L(k,k)=sqrt(A(k,k)-soma);
		for i=k+1:n
			soma=0;
			for r=1:k-1
				soma=soma+L(i,r)*L(k,r);
			endfor %r
			L(i,k)=(A(i,k)-soma)/L(k,k);
		end%for %i
	end%for %k
	k=n;
		soma=0;
		for r=1:k-1
			soma=soma+L(k,r)^2;
		endfor %r
		L(k,k)=sqrt(A(k,k)-soma);
%L
%U=transpose(L) %apenas para visualizar a matriz U como transposta de L
%A-L*U % apenas para aferição
% Resolvendo os m sistemas, para o termo independente k=1:m
 x=fsubstCholesky(n,L,b);
end%for %k
