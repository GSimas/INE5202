function [x y1 y2 y3]=fRK4sis3(n,a,b,x,y1,y2,y3)
% Montando o sistema de EDOs para a equação de Blasius
%F'''-0.5*F*F''=0 
fy1 = @(x,y1,y2,y3) y2;          %Exercicio 9.6
fy2 = @(x,y1,y2,y3) y3;          %Exercicio 9.6
fy3 = @(x,y1,y2,y3) -0.5*y1*y3;  %Exercicio 9.6
  h=(b-a)/n;
  for k=1:n
    x(k+1)=x(k)+h;
    K1y1=fy1(x(k), y1(k)           , y2(k)           , y3(k));
    K1y2=fy2(x(k), y1(k)           , y2(k)           , y3(k));
    K1y3=fy3(x(k), y1(k)           , y2(k)           , y3(k));
    K2y1=fy1(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3);
    K2y2=fy2(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3);
    K2y3=fy3(x(k), y1(k)+0.5*h*K1y1, y2(k)+0.5*h*K1y2, y3(k)+0.5*h*K1y3);
    K3y1=fy1(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3);
    K3y2=fy2(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3);
    K3y3=fy3(x(k), y1(k)+0.5*h*K2y1, y2(k)+0.5*h*K2y2, y3(k)+0.5*h*K2y3);
    K4y1=fy1(x(k), y1(k)+h*K3y1    , y2(k)+h*K3y2    , y3(k)+h*K3y3);
    K4y2=fy2(x(k), y1(k)+h*K3y1    , y2(k)+h*K3y2    , y3(k)+h*K3y3);
    K4y3=fy3(x(k), y1(k)+h*K3y1    , y2(k)+h*K3y2    , y3(k)+h*K3y3);
    y1(k+1)=y1(k)+h*(K1y1+2*K2y1+2*K3y1+K4y1)/6;
    y2(k+1)=y2(k)+h*(K1y2+2*K2y2+2*K3y2+K4y2)/6;
    y3(k+1)=y3(k)+h*(K1y3+2*K2y3+2*K3y3+K4y3)/6;
    end % for i
end %function
