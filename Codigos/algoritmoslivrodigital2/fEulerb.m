function [x y]=fEuler(n,a,b,x,y)
h=(b-a)/n; % espacamento em x
for k=1:n
    K1f=f11(x(k),y(k));
    x(k+1)=x(k)+h;
    y(k+1)=y(k)+h*K1f;
end
end