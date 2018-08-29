function Ndecimais=fNdecimais(n,coef)
Ncoef=[];
for i=1:n+1
	aux=coef(i);
	dif=1;cont=-1;
	while(dif>1e-8)
	%aux
	%round(aux)
		dif=abs(aux-round(aux));
		%printf("\n dif: %.20f",dif)
		aux=aux*10;
	  cont=cont+1;
	end
	Ncoef=[Ncoef cont];
end 
Ndecimais=max(Ncoef);
end