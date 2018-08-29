function [x y]=fRK4b(n,a,b,x,y)
f=@(x,y)exp(-x)-x.*exp(-x);     %Figura 9.4 (a) (b)
h=(b-a)/n; % espacamento em x
for k=1:n
    K1f=f(x(k),      y(k)          );
    K2f=f(x(k)+0.5*h,y(k)+0.5*h*K1f);
    K3f=f(x(k)+0.5*h,y(k)+0.5*h*K2f);
    K4f=f(x(k)+h,    y(k)+    h*K3f);
    x(k+1)=x(k)+h;
    y(k+1)=y(k)+(h/6)*(K1f+2*(K2f+K3f)+K4f);
end
end