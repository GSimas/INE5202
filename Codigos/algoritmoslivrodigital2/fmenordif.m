function menordif=fmenordif(n,coef)
for i=1:n+1 for j=1:n+1 dif(i,j)=max(abs(coef)); end end
for i=1:n+1 
	for j=1:i-1
	  dif(i,j)=abs(abs(coef(i))-abs(coef(j)));
	end
	for j=i+1:n+1
	  dif(i,j)=abs(abs(coef(i))-abs(coef(j)));
	end
end
menordif=min(min(dif))/max(abs(coef)); %menor diferença de coeficientes, normalizada pelo maior coeficiente.
end