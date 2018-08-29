function [x y1 y2 y3 y4]=fRK4sist4(n,a,b,x,y1,y2,y3,y4)
%Problema de valor no contorno Exercicio 9.7
%F''''+6x^(-4)=0 com solução exata F(x)=ln(x)
fh1 = @(x,y1,y2,y3,y4) y2;          %Exercicio 9.7
fh2 = @(x,y1,y2,y3,y4) y3;          %Exercicio 9.7
fh3 = @(x,y1,y2,y3,y4) y4;          %Exercicio 9.7
fh4 = @(x,y1,y2,y3,y4) -6./x.^4;    %Exercicio 9.7
  h=(b-a)/n;
  for k=1:n
    x(k+1)=x(k)+h;
    K1y1=fh1(x(k), y1(k)           , y2(k)           , y3(k)           ,     y4(k));
    K1y2=fh2(x(k), y1(k)           , y2(k)           , y3(k)           ,     y4(k));
    K1y3=fh3(x(k), y1(k)           , y2(k)           , y3(k)           ,     y4(k));
    K1y4=fh4(x(k), y1(k)           , y2(k)           , y3(k)           ,     y4(k));
    
    K2y1=fh1(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3, y4(k)+0.5*h*K1y4);
    K2y2=fh2(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3, y4(k)+0.5*h*K1y4);
    K2y3=fh3(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3, y4(k)+0.5*h*K1y4);
    K2y4=fh4(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3, y4(k)+0.5*h*K1y4);
    
    K3y1=fh1(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3, y4(k)+0.5*h*K2y4);
    K3y2=fh2(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3, y4(k)+0.5*h*K2y4);
    K3y3=fh3(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3, y4(k)+0.5*h*K2y4);
    K3y4=fh4(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3, y4(k)+0.5*h*K2y4);
    
    K4y1=fh1(x(k), y1(k)+    h*K3y1, y2(k)+    h*K3y2, y3(k)+    h*K3y3, y4(k)+    h*K3y4);
    K4y2=fh2(x(k), y1(k)+    h*K3y1, y2(k)+    h*K3y2, y3(k)+    h*K3y3, y4(k)+    h*K3y4);
    K4y3=fh3(x(k), y1(k)+    h*K3y1, y2(k)+    h*K3y2, y3(k)+    h*K3y3, y4(k)+    h*K3y4);
    K4y4=fh4(x(k), y1(k)+    h*K3y1, y2(k)+    h*K3y2, y3(k)+    h*K3y3, y4(k)+    h*K3y4);
    
    y1(k+1)=y1(k)+h*(K1y1+2*K2y1+2*K3y1+K4y1)/6;
    y2(k+1)=y2(k)+h*(K1y2+2*K2y2+2*K3y2+K4y2)/6;
    y3(k+1)=y3(k)+h*(K1y3+2*K2y3+2*K3y3+K4y3)/6;
    y4(k+1)=y4(k)+h*(K1y4+2*K2y4+2*K3y4+K4y4)/6;
    end % for i
end %function
