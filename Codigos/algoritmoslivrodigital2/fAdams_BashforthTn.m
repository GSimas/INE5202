function [x y]=fAdams_BashforthTn(n,a,b,x,y);
f = @(x,y)x-y+2;     %Exemplo 9.1
h=(b-a)/n; % espacamento em x
[x y]=fRK2(1,x(1),x(1)+h,x,y); %com 1 espaçamento RK2 determina apenas o 2o ponto x(2),y(2)
%usa 2 pontos iniciais: x(1),y(1) e x(2),y(2)
for k=2:n
    K_1=f(x(k-1),y(k-1)); %inclinação no ponto anterior
    K1 =f(x(k),y(k));     %inclinação no ponto atual
    x(k+1)=x(k)+h;
    y(k+1)=y(k)+0.5*h*(3*K1-K_1);
end
end