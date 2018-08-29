function D=fdesvioPn(n,a,m,x,y)
D=0;
for k=1:m
	D=D+(fPnH(n,a,x(k))-y(k))^2;
end%for
end