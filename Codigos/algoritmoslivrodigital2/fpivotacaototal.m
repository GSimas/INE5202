function [A I]=fpivotacaototal(k,n,A,I)
% escolha e localização do maior modulo da matriz, a partir da linha k: Amax, imax e jmax
	Amax=0.;
	imax=k;jmax=k;
	for i=k:n
	for j=k:n
			if(abs(A(i,j))>Amax)
				Amax=abs(A(i,j));
				imax=i;jmax=j;
			end %if
		end %for j
	end %for i
% troca de linhas, entre a linha i=k e a linha i=imax
	Aux=A(k,:);
	A(k,:)=A(imax,:);
	A(imax,:)=Aux;
% troca de colunas, entre a coluna j=k e a coluna j=jmax
	Aux=A(:,k);
	A(:,k)=A(:,jmax);
	A(:,jmax)=Aux;
% troca de colunas, também troca o indice I das incógnitas
	Iaux=I(k);
	I(k)=I(jmax);
	I(jmax)=Iaux;
end %function
