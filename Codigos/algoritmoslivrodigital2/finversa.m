function A1=finversa(n,A)
	A=[A eye(n)] %matriz aumentada: A concatenada com eye (identidade)
	for k=1:n
% Escolhe a melhor linha i=k, antes de efetuar a eliminacao
% retorna a matriz expandida A com linhas trocadas. 
		[A]=fpivotacaoparcial(k,n,A);
		A(k,k+1:2*n)=A(k,k+1:2*n)/A(k,k);A(k,k)=1.;%normalização
		for i=1:k-1  %linhas acima de k
			aux=A(i,k);
			for j=k+1:2*n %operações com mínimo de colunas 
				A(i,j)=A(i,j)-aux*A(k,j);
			end %for j
			A(i,k)=0;%valor exato, calculado algebricamente
		end %for i
		for i=k+1:n  %linhas abaixo de k
			aux=A(i,k);
			for j=k+1:2*n %operações com mínimo de colunas 
				A(i,j)=A(i,j)-aux*A(k,j);
			end %for j
			A(i,k)=0;%valor exato, calculado algebricamente
		end %for i
		end %for k
A1=A(:,n+1:2*n);%toma apenas os elementos da 2a.parte da matriz, onde estava I
end %function
