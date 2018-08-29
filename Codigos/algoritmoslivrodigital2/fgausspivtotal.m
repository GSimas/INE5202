function x=fgausspivtotal(n,A)
%EScalonamento
	I=[1:n]; %ordem original das incógnitas
	for k=1:n-1
% retorna a matriz expandida A com linhas e colunas trocadas. 
		[A I]=fpivotacaototal(  k,n,A,I); %pivotação desabilitada com % ('%=comentario')
% Escolhe a melhor linha i=k, antes de efetuar a eliminacao
		for i=k+1:n
			aux=A(i,k)/A(k,k);
			for j=k+1:n+1 %operações com mínimo de colunas 
				A(i,j)=A(i,j)-aux*A(k,j);
			end %for j
			A(i,k)=0;%valor exato, calculado algebricamente
		end %for i
	end %for k
%Retrosubstituição
%com tratamento de uma equação(linha) linearmente dependente
if (abs(A(n,n))<1e-14) %diagonal principal numericamente nula
	if(abs(A(n,n+1))<1e-14) %termo independente numericamente nulo
		printf("\n Sistema Indeterminado\n\n");%ultima linha eh 
				%toda zerada
		xa(n)=1;%Valor ESCOLHIDO, para uma possível solução
	else%if2		%termo independente NAO nulo
		printf("\n Sistema Impossivel\n\n");%ultima linha 
				%inconsistente
		xa(n)=NaN; %registro "not a number", solução vazia
	end%if2
else %if1	%diagonal principal NAO nula
	printf("\n Sistema Determinado\n\n");%ultima linha eh 
	xa(n)=A(n,n+1)/A(n,n); %sistema possivel, solução unica para i=n
end %if1
  
	for i=n-1:-1:1 % calculos a partir da penultima equação
		soma=0;
		for j=i+1:n
			soma=(A(i,j)*xa(j))+soma;
		end
		xa(i)=(A(i,n+1)-soma)/A(i,i);
	end

%reordena as incógnitas xa, conforme lista I[i], para o caso de pivotação total:
for i=1:n 
    x(I(i))=xa(i);
end
x=transpose(x);
end