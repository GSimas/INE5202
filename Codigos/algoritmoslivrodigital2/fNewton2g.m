function x=fNewton2g(xi)
dx=[1.e-6 1.e-6];
dif=1; k=0;
while (dif>1.e-14 && k<30)
	k=k+1;
A=[(g1([xi(1)+dx(1),xi(2)])-g1(xi))/dx(1),(g1([xi(1),xi(2)+dx(2)])-g1(xi))/dx(2),-g1(xi);
   (g2([xi(1)+dx(1),xi(2)])-g2(xi))/dx(1),(g2([xi(1),xi(2)+dx(2)])-g2(xi))/dx(2),-g2(xi);];
	dx=fgausspivparcial(2,A);
	x=xi+dx;
	xi=x;
	dif=max(abs(dx));
end %while
end