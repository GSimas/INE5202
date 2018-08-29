function c=fcoefMaclaurin1(grau)
%f(x)=integral entre 0 e x de exp(-z^2)
%coeficientes nulos de índices i impares:
for i=1:2:grau+1
  c(i)=0; 
end
%coeficientes não nulos de índices (2*i+2) pares:
for i=0:1:fix((grau-1)/2) %grau=(2*i+1) -> ultimo indice = grau+1
  c(2*i+2)=(-1)^i/(factorial(i)*(2*i+1));
end
end