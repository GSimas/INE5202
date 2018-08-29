function difdiv1=fdifdiv(n,x,y)
%diferencas divididas em todo i
k = 1;	 %diferenças de 1ª ordem
for i = 1:n
	difdiv(i,1)= (y(i+1)-y(i))/(x(i+1)-x(i));
end
for k = 2:n  %diferenças de kª ordem
	for i = 1:n+1-k
		difdiv(i,k) = (difdiv(i+1,k-1) - difdiv(i,k-1))/(x(i+k)-x(i));
	end
end
% difdiv % variável matricial local, memória local descartada após o calculo
difdiv1= difdiv(1,:);%vetor somente com diferenças no ponto i = 1, para todos os k
end