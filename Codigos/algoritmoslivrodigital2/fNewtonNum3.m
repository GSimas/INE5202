function x=fNewtonNum3(xi)
dif=1;tol=1e-14;k=0; 
dx= 10*[tol tol tol];%valor inicial de dx
while dif > tol && k<30 
  k=k+1;
	x1dx=[xi(1)+dx(1),xi(2),xi(3)];%vetor x(1) com incremento
	x2dx=[xi(1),xi(2)+dx(2),xi(3)];%vetor x(2) com incremento
	x3dx=[xi(1),xi(2),xi(3)+dx(3)];%vetor x(3) com incremento  
	f1xi=f1(xi); %f1 aplicada no ponto inicial xi
	f2xi=f2(xi); %f2 aplicada no ponto inicial xi
	f3xi=f3(xi); %f3 aplicada no ponto inicial xi
	A(1,1)=(f1(x1dx)-f1xi)/dx(1);
	A(1,2)=(f1(x2dx)-f1xi)/dx(2);
	A(1,3)=(f1(x3dx)-f1xi)/dx(3);
	A(1,4)=-f1xi;
	A(2,1)=(f2(x1dx)-f2xi)/dx(1);
	A(2,2)=(f2(x2dx)-f2xi)/dx(2);
	A(2,3)=(f2(x3dx)-f2xi)/dx(3);
	A(2,4)=-f2xi; 
	A(3,1)=(f3(x1dx)-f3xi)/dx(1);
	A(3,2)=(f3(x2dx)-f3xi)/dx(2);
	A(3,3)=(f3(x3dx)-f3xi)/dx(3);
	A(3,4)=-f3xi; 
	dx=fgauss(3,A);
	x=xi+dx;
	xi=x;
	dif=min(abs(dx));%Criterio ‘min’ pois dx é denominador
end %while
dif
k
FNN=[f1(x); f2(x); f3(x);]
end

