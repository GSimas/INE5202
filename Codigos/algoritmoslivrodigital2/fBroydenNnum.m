function X2=fBroydenNnum(n,X0)
X0=transpose(X0);
dif=1;tol=1e-14;k=0; 
for i=1:n Dx(i)=1e-6; end%valor inicial de dx
F0=transpose(G(X0));     %Valor inicial
Xj=X0;
for j=1:n %varre as colunas
    Xj(j)=X0(j)+Dx(j); %incremento na coluna j
    J(:,j)=(transpose(G(Xj)) .- F0)/Dx(j); 
    Xj=X0;% volta ao valor original
end
Jinv=inv(J);
DX=-Jinv*F0;
X1=X0+DX;
F1=transpose(G(X1));
DF=F1-F0;
dif=1;k=0;
while (dif>tol && k<30)
 k=k+1;
 Jinv=Jinv+((DX-(Jinv*DF))*transpose(DX))*Jinv/(transpose(DX)*Jinv*DF);
 DX=-Jinv*F1;
 X2=X1+DX;
 F2=transpose(G(X2)); 
 DF=F2-F1;
 X1=X2;F1=F2;
 dif=min(abs(DX));%Criterio ‘min’ pois dx é denominador
end
k
dif
end
