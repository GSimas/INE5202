%Algoritmo de Newton para determinar Raiz Quadrada de C:
function x=fraizquadrada(C)
	%sqrt(C)=x=>? ; f(x)=x^2-C; f'(x)=2*x
	%x=xi-f(xi)/df(xi); x=x-(x^2-C)/(2*x);  x=0.5*(x+C/)x;
%Valor inicial
	x=flocalizaraizquadrada(C); %x=26.370122 p/ C=685.72
	k=0;dif=1;
	while( dif>1.e-16 && k<100 )
	      k++;
	      xi=x;
	      x=0.5*(x+C/x);
	      dif=abs((x-xi)/x);
	end
	k;
	dif;
end