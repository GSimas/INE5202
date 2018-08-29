function x=fNewton2h(xi)
dx=[1.e-6 1.e-6];
dif=1; k=0;
while (dif>1.e-14 && k<30)
	k=k+1;
A=[(h1([xi(1)+dx(1),xi(2)])-h1(xi))/dx(1),(h1([xi(1),xi(2)+dx(2)])-h1(xi))/dx(2), -h1(xi); 
   (h2([xi(1)+dx(1),xi(2)])-h2(xi))/dx(1),(h2([xi(1),xi(2)+dx(2)])-h2(xi))/dx(2), -h2(xi);];
	dx=fgauss(2,A);
	x=xi+dx;
	xi=x;
	dif=max(abs(dx));
end %while
end
