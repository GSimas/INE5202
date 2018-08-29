function x=fNewtonNum2a(xi)
dif=1;tol=1e-14;k=0; 
dx= 1e6*[tol tol];%valor inicial de dx
while dif > tol && k<300 
  k=k+1;
	x1dx=[xi(1)+dx(1),xi(2)      ];%vetor x(1) com incremento
	x2dx=[xi(1)      ,xi(2)+dx(2)];%vetor x(2) com incremento

	f1xi=f1a(xi); %f1 aplicada no ponto inicial xi
	f2xi=f2a(xi); %f2 aplicada no ponto inicial xi

	A(1,1)=(f1a(x1dx)-f1xi)/dx(1);
	A(1,2)=(f1a(x2dx)-f1xi)/dx(2);
	A(1,3)=-f1xi;
  
	A(2,1)=(f2a(x1dx)-f2xi)/dx(1);
	A(2,2)=(f2a(x2dx)-f2xi)/dx(2);
	A(2,3)=-f2xi;

	dx=fgausspivparcial(2,A);
	x=xi+dx;
	xi=x;
	dif=min(abs(dx./x));%Criterio ‘min’ pois dx é denominador
end %while
dif
k
FNN2=[f1a(x); f2a(x);]
end

