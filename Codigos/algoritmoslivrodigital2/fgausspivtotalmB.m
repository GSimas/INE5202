function x=fgausspivparcialmB(n,A,m,B)
%EScalonamento
	for k=1:n-1
% retorna a matriz expandida A com linhas trocadas. 
		[A B]=fpivotacaoparcialmB(k,n,A,m,B);
% Escolhe a melhor linha i=k, antes de efetuar a eliminacao
		for i=k+1:n
			aux=A(i,k)/A(k,k);
			for j=k+1:n  A(i,j)=A(i,j)-aux*A(k,j);  end %operações em A
			for j=1:m    B(i,j)=B(i,j)-aux*B(k,j);  end %operações em B
			A(i,k)=0;%valor exato, calculado algebricamente
		end %for i
	end %for k
A
B
for r=1:m
%Retrosubstituição
%com tratamento de uma equação(linha) linearmente dependente
if (abs(A(n,n))<1e-14) %diagonal principal numericamente nula
	if(abs(A(n,n+1))<1e-14) %termo independente numericamente nulo
		printf("\n Sistema Indeterminado\n\n");%ultima linha eh 
				%toda zerada
		x(n,r)=0;%Valor ESCOLHIDO, para uma possível solução
	else%if2		%termo independente NAO nulo
		printf("\n Sistema Impossivel\n\n");%ultima linha 
				%inconsistente
		x(n,r)=NaN; %registro "not a number", solução vazia
	end%if2
else %if1	%diagonal principal NAO nula
	x(n,r)=B(n,r)/A(n,n); %sistema possivel, solução unica para i=n
	for i=n-1:-1:1 % calculos a partir da penultima equação
		soma=0;
		for j=i+1:n
			soma=(A(i,j)*x(j,r))+soma;
		end
		x(i,r)=(B(i,r)-soma)/A(i,i);
	end
end %if1
end