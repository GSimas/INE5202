function D=fdesvioPvT(a,b,m,R,P,v,T)
D=0;
for k=1:m
	D=D+(funcaoP(a,b,R,v(k),T(k))-P(k))^2;
end%for
D=D/m;
end
