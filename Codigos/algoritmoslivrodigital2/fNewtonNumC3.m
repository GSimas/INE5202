function C=fNewtonNumC3(n,a,b,x,y1,y2,Ci,D,tol)%Método da secante:
 dif = 1; k = 0;dx=1e-1;
 C1=Ci;   f1=f10(n,a,b,x,y1,y2,C1,D);
 C2=Ci+dx;
while (dif>tol && k<100)
    k = k + 1; % passo k iterativo
    f2=f10(n,a,b,x,y1,y2,C2,D);
    C  = (C1*f2-C2*f1)/(f2-f1);
    C1=C2;f1=f2;
    C2=C;
    dif=abs(C2-C1);
end
k
dif;
end