function f = fL1(n,x,i,xp)
for ip=1:length(xp)
%Calcula-se primeiro o numerador com ‘todas’ as parcelas:
	num=1;den=1;
	for j=1:n+1
		if (j!= i) num=num*(xp(ip)-x(j));den=den*(x(i)-x(j));end %if
	end%for
  f(ip)=num/den;
end%ip
end%function