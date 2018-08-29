function c=fcoefMaclaurin2(n,a,b)
%f(x)=ln(x)
c(1)=log(0.5*(b+a));
for i=1:n
	c(i+1)=(-1)^(i+1)*((b-a)/(b+a))^i/(i);
end #for
end