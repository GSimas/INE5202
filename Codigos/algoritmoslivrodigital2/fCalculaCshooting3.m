function C=fCalculaCshooting3(n,a,b,x,y1,y2,Ci,D,tol)
C1=Ci; C2=C1+0.1;
k=0;
while (abs(C2-C1)>tol && k<10)
  k=k+1;
  
  y3(1)=C1;
  [x y1 y2 y3]=fRK4sis3(n,a,b,x,y1,y2,y3);
  D1=y2(n+1);
  
  y3(1)=C2;
  [x y1 y2 y3]=fRK4sis3(n,a,b,x,y1,y2,y3);
  D2=y2(n+1);
  
  C=C1+((D-D1)/(D2-D1))*(C2-C1);
  C1=C2; %C2 e C sao considerados os melhores valores, descarta C1
  C2=C;
  dif=max(abs(C2-C1));
end %while
k
end