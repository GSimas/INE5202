function f = fLagrange(n,x,y,xp)
%Forma otimizada. Nao deve ser usada para avaliar xp=x
for ip=1:length(xp)
%Calcula-se primeiro o numerador com ‘todas’ as parcelas:
num=1.;
for j=1:n+1
	num=num*(xp(ip)-x(j));
end%for
f(ip)=0;
for i=1:n+1
	den = 1;
	for j=1:n+1
		if (j != i) den=den*(x(i)-x(j));end %if
	end%for
	f(ip)=f(ip)+y(i)*num/(den*(xp(ip)-x(i)));%retira-se a parcela j!=i
end%for
end%ip
end%function