function [A B]=fpivotacaoLU(k,n,A,m,B)
max=0;
for i=k:n
if abs(A(i,k))>max
	max=abs(A(i,k)); imax=i;
	end
end	
%Troca de linhas na matriz a
for j=1:n
	Aoriginal=A(k,j);
	A(k,j)=A(imax,j);
	A(imax,j)=Aoriginal;
end
%Troca de linhas na matriz b, de termos independentes
for j=1:m
	Boriginal=B(k,j);
	B(k,j)=B(imax,j);
	B(imax,j)=Boriginal;
end
end