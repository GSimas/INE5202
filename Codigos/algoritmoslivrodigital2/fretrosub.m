function x=fretrosub(n,A,I)
%com tratamento de uma equação(linha) linearmente dependente
if (abs(A(n,n))<1e-14) %diagonal principal numericamente nula
	if(abs(A(n,n+1))<1e-14) %termo independente numericamente nulo
		printf("\n Sistema Indeterminado\n\n");%ultima linha eh 
				%toda zerada
		xa(n)=0;%Valor ESCOLHIDO, para uma possível solução
	else%if2		%termo independente NAO nulo
		printf("\n Sistema Impossivel\n\n");%ultima linha 
				%inconsistente
		xa(n)=NaN; %registro not a number, solução vazia
	end%if2
else %if1	%diagonal principal NAO nula
	xa(n)=A(n,n+1)/A(n,n); %sistema possivel, solução unica para i=n
	for i=n-1:-1:1 % calculos a partir da penultima equação
		soma=0;
		for j=i+1:n
			soma=(A(i,j)*xa(j))+soma;
		end
		xa(i)=(A(i,n+1)- soma)/A(i,i);
	end
end %if1
%reordena as incógnitas xa, conforme lista I[i], para o caso de pivotação total:
for i=1:n 
    x(i)=xa(I(i));
end
end
