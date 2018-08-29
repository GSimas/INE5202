function [n a]=fdivisao (n,a,x,M)
%Aplica Briot Ruffini M vezes
for k=1:M
    %nucleo do Briot Ruffini
    b(1)=a(1);
    for i=2:n+1
        b(i)=a(i)+x*b(i-1);
    end
    %redefinindo o polinomio quociente
    n=n-1;
    a=b;
    %nucleo do Briot Ruffini
end
aux=a(1:n+1);a=aux; %limpa a memoria dos coeficientes 'a' antigos, além do novo n+1
end