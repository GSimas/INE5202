function raio=fkojima(n,a)
%Calcula o máximo modulo de todas as raízes pela Cota de Kojima
	for i=1:n
		q(i)=abs(a(i+1)/a(1))^(1/i);
	end
	%q
	q=sort(q);%ordena o vetor q, em ordem crescente 
	raio=q(n);
	if n>1 raio=raio+q(n-1); end %toma os 2 ultimos valores de q, que são os maiores 
end #function