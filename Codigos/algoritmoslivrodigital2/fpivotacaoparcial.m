function [A]=fpivotacaoparcial(k,n,A) 
%permutacao de linhas para escolher a melhor linha i=k(maior modulo na diagonal principal)
Amax=abs(A(k,k));
imax=k; %linha que contem o maior modulo
for i=k+1:n
    if abs(A(i,k))>Amax
       Amax=abs(A(i,k));
       imax=i;
    end
end
aux=A(k,:);A(k,:)=A(imax,:);A(imax,:)=aux;
end
