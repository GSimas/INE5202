function c=fcoefMaclaurin3(grau)
%f(x)=sen(x)
naux=fix((grau-1)/2); %grau=(2*n+1) -> ultimo indice = grau+1
%coeficientes nulos de índices i impares:
for i=1:2:grau+1  
  c(i)=0; 
end
%coeficientes não nulos de índices (2*i+1) pares:
for i=1:1:naux+1
  c(2*i)=(-1)^(i+1)/factorial((2*i-1));
end
end