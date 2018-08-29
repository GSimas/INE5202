function [x y1 y2]=fRK4sist2(n,a,b,x,y1,y2)
z1 = @(x,y1,y2) y2;                        %Exemplo 9.5
z2 = @(x,y1,y2) 4*y2-4*y1+8*x*x-16*x+4;    %Exemplo 9.5
h=(b-a)/n; % espacamento em x
for k=1:n
%inclinações no ponto inicial:
    K1z1=z1(x(k),      y1(k),          y2(k)            );
    K1z2=z2(x(k),      y1(k),          y2(k)            );
% inclinações no ponto intermediário:
    K2z1=z1(x(k)+0.5*h,y1(k)+0.5*h*K1z1,y2(k)+0.5*h*K1z2);
    K2z2=z2(x(k)+0.5*h,y1(k)+0.5*h*K1z1,y2(k)+0.5*h*K1z2);
% inclinações no ponto intermediário:
    K3z1=z1(x(k)+0.5*h,y1(k)+0.5*h*K2z1,y2(k)+0.5*h*K2z2);
    K3z2=z2(x(k)+0.5*h,y1(k)+0.5*h*K2z1,y2(k)+0.5*h*K2z2);
% inclinações no ponto final:
    K4z1=z1(x(k)+h,      y1(k)+h*K3z1,  y2(k)+h*K3z2    );
    K4z2=z2(x(k)+h,      y1(k)+h*K3z1,  y2(k)+h*K3z2    );
%valor no ponto final:
    x(k+1)=x(k)+h;
    y1(k+1)=y1(k)+(h/6)*(K1z1+2*(K2z1+K3z1)+K4z1);
    y2(k+1)=y2(k)+(h/6)*(K1z2+2*(K2z2+K3z2)+K4z2);
end
end
