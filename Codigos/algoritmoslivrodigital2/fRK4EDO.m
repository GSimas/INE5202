function [x y]=fRK4EDO(n,a,b,x,y)
h=(b-a)/n; % espacamento em x
[1 x(1) y(1)];
for k=1:n
    K1f=f(x(k),      y(k)          );
    K2f=f(x(k)+0.5*h,y(k)+0.5*h*K1f);
    K3f=f(x(k)+0.5*h,y(k)+0.5*h*K2f);
    K4f=f(x(k)+h,    y(k)+h*K3f    );
    K4f=f(x(k)+h,    y(k)+h*K3f    );
    x(k+1)=x(k)+h;
    y(k+1)=y(k)+(h/6)*(K1f+2*(K2f+K3f)+K4f);
    [k+1 x(k+1) y(k+1)];
end
end