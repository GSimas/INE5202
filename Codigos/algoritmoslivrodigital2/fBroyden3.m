function X2=fBroyden3(X0)
X0=transpose(X0);
dif=1;tol=1e-14;k=0; 
  J(1,1)=2*X0(1);J(1,2)=2*X0(2);J(1,3)=2*X0(3);
  J(2,1)=4*X0(1);J(2,2)=2*X0(2);J(2,3)=-4;     
  J(3,1)=6*X0(1);J(3,2)=-4;     J(3,3)=2*X0(3);
F0=transpose(G(X0));
Jinv=inv(J);
%J*Jinv %afericao
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
 dif=sum(abs(DX));
end
k
dif
end
