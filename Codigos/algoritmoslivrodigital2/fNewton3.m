function x=fNewton3(xi)
dif=1;tol=1e-14;k=0; 
while dif > tol && k<25 
  k=k+1;
	A(1,1)=2*xi(1);A(1,2)=2*xi(2);A(1,3)=2*xi(3);
	A(2,1)=4*xi(1);A(2,2)=2*xi(2);A(2,3)=-4;    
	A(3,1)=6*xi(1);A(3,2)=-4;     A(3,3)=2*xi(3);
	A(:,4)=-G(xi);
	dx=fgausspivparcial(3,A);
	x=xi+dx;
	xi=x;
	dif=sum(abs(dx)); %ou max(abs(dx))
end%while
k
dif
end