function x=ftrid(n,r,t,d,b)
%Escalonamento:
	for i=2:n
		aux=t(i)/r(i-1);
		r(i)=r(i)-aux*d(i-1);
		b(i)=b(i)-aux*b(i-1);
		t(i)=0;  %opcional
	end
%Retrosubstituicoes:
	x(n)=b(n)/r(n);
	for i=n-1:-1:1
		x(i)=(b(i)-d(i)*x(i+1))/r(i);
	end
end