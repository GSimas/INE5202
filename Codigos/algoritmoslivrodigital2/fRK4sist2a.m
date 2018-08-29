function [x y1 y2]=fRK4sist2a(n,a,b,x,y1,y2)
h=(b-a)/n; % espacamento em x
for k=1:n
    K1f1=fy1(x(k),      y1(k),           y2(k)           );
    K1f2=fy2(x(k),      y1(k),           y2(k)           );
    K2f1=fy1(x(k)+0.5*h,y1(k)+0.5*h*K1f1,y2(k)+0.5*h*K1f2);
    K2f2=fy2(x(k)+0.5*h,y1(k)+0.5*h*K1f1,y2(k)+0.5*h*K1f2);
    K3f1=fy1(x(k)+0.5*h,y1(k)+0.5*h*K2f1,y2(k)+0.5*h*K2f2);
    K3f2=fy2(x(k)+0.5*h,y1(k)+0.5*h*K2f1,y2(k)+0.5*h*K2f2);
    K4f1=fy1(x(k)+h,    y1(k)+    h*K3f1,y2(k)+    h*K3f2);
    K4f2=fy2(x(k)+h,    y1(k)+    h*K3f1,y2(k)+    h*K3f2);
    x(k+1)=x(k)+h;
    y1(k+1)=y1(k)+(h/6)*(K1f1+2*(K2f1+K3f1)+K4f1);
    y2(k+1)=y2(k)+(h/6)*(K1f2+2*(K2f2+K3f2)+K4f2);
end
end