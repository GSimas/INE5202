function D=fModuloDesviosPn(n,a,m,x,y)
D=0;
for k=1:m
	D=D+abs(fPnH(n,a,x(k))-y(k));
end%for
end