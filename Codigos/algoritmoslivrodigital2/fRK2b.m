function [x y]=fRK2b(n,a,b,x,y)
f=@(x,y)exp(-x)-x.*exp(-x);     %Figura 9.4 (a) (b)
h=(b-a)/n; % espacamento em x
for k=1:n
    K1f=f(x(k)  ,y(k)      );
    K2f=f(x(k)+h,y(k)+h*K1f);
    x(k+1)=x(k)+h;
    y(k+1)=y(k)+(h/2)*(K1f+K2f);
end
end