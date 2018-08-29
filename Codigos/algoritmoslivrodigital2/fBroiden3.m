function x1=fBroiden3(x0)
X0=transpose(x0);
dif=1;tol=1e-15;k=0; 
%%J0
  J(1,1)=2*x0(1);J(1,2)=2*x0(2);J(1,3)=2*x0(3);
	J(2,1)=4*x0(1);J(2,2)=2*x0(2);J(2,3)=-4;     
	J(3,1)=6*x0(1);J(3,2)=-4;     J(3,3)=2*x0(3);
F0=[f1(x0); f2(x0); f3(x0)];
Jinv=inv(J);
%J*Jinv
DX=-Jinv*F0;
X1=X0+DX;
x1=transpose(X1);
F1=[f1(x1); f2(x1); f2(x1);];
DF=F1-F0;
dif=1;k=0;
while (dif>tol && k<30)
 k=k+1;
 Jinv=Jinv+((DX-(Jinv*DF))*transpose(DX))*Jinv/(transpose(DX)*Jinv*DF);
 DX=-Jinv*F1;
 X2=X1+DX;
 x1=transpose(X2);
 F2=[f1(x1); f2(x1); f3(x1);];
 DF=F2-F1;
 X1=X2;F1=F2;
 dif=sum(abs(DX));
end
dif
k
FB=[f1(x1); f2(x1); f3(x1);]
end