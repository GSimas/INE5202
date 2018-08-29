function [A B]=fLUCrout(n,A,m,B)
Ao=A;
	 k=1;
%li1=ai1 -> a(i,1)=a(i,1) Para i=1:n
	 [A B]=fpivotacaoLU(k,n,A,m,B);
%	 u1j=a1j/l(1,1)
	for j=2:n
		A(1,j)=A(1,j)/A(1,1);
	end
	for k=2:n-1
%lik=aik-somatorio(lir*urk) //para todo i=k:n
		for i=k:n
			soma=0;
			for r=1:k-1
				soma=soma+A(i,r)*A(r,k);
			end %r
			A(i,k)=A(i,k)-soma;
		end %i
		[A B]=fpivotacaoLU(k,n,A,m,B);
%ukj=(1/lkk)*(akj-somatorio(lkr*urj))
		for j=k+1:n
			soma=0;
			for r=1:k-1
				soma=soma+A(k,r)*A(r,j);
			end %r
			A(k,j)=(A(k,j)-soma)/A(k,k);
		end %j
		A;
	end %k
	k=n;
%lik=aik-somatorio(lir*urk) //para todo i=k:n
		for i=k:n
			soma=0;
			for r=1:k-1
				soma=soma+A(i,r)*A(r,k);
			end %r
			A(i,k)=A(i,k)-soma;
		end %i
		A;%contém as matrizes L e U sobrepostas
%para efeitos de impressão, pode-se separar L e U: (desabilitado com %
%L(n,n)=0; for i=1:n           for j=1:i   L(i,j)=A(i,j); end end
%U(n,n)=0; for i=1:n U(i,i)=1; for j=i+1:n U(i,j)=A(i,j); end end
%%verificação de mal caondicionamento
detA=1;
for i=1:n detA=detA*A(i,i); end
detA
for i=1:n alfa(i)=sum(Ao(i,:).^2); end
alfa
prod=1; for i=1:n prod=prod*alfa(i); end
prod
detAn=detA/sqrt(prod)
if (detAn<0.1) printf("\nSistema mal-condicionado\n") end
end