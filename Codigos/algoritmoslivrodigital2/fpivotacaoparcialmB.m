function [A B]=fpivotacaoparcialmB(k,n,A,m,B) 
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
aux2=B(k,:);B(k,:)=B(imax,:);B(imax,:)=aux2;
end
