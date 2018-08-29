function NExp=fNExp(C)
%determina exponte de C, de modo que os significativos fiquem na mantissa M fracionaria
if C<1
	aux=C;
	dif=1;cont=1;
	while(aux<1)
	cont=cont-1;
	aux=aux*10;
	end 
	NExp=cont;
end
if C>1
	aux=C;
	dif=1;cont=0;
	while(aux>1)
	cont=cont+1;
	aux=aux/10;
	end 
	NExp=cont;
end
end
