function Y=Fb(x)
m=5;
T= [0.2   0.4    0.6   0.8  1.0];
V= [0.04  0.14   0.26  0.39 0.50];

Y(1)=0;
for k=1:m
   Y(1)=Y(1)+((x(1)+x(2)*T(k)^(-2))^(-1)-V(k))*(x(1)+x(2)*T(k)^(-2))^(-2);
end

Y(2)=0;
for k=1:m
   Y(2)=Y(2)+((x(1)+x(2)*T(k)^(-2))^(-1)-V(k))*(x(1)+x(2)*T(k)^(-2))^(-2)*T(k)^(-2);
end
end