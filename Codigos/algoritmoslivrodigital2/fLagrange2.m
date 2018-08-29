function f = fLagrange2(n,x,y,xp)
%forma tradicional nao otimizada
for ip=1:length(xp)
f(ip)=0;
for i=1:n+1
  num=1.;den = 1;
	for j=1:n+1
	  if (j != i) num=num*(xp(ip)-x(j));den=den*(x(i)-x(j));end %if
	end%for
	f(ip)=f(ip)+y(i)*num/den;%retira-se a parcela j!=i
end%for
end%ip
end%function