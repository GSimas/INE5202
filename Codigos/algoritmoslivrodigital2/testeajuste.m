clear
clc
m=21
N=[ 1.0 : 0.05 : 2.0   ]
C=[ 0.0 : 0.20 : 4.0   ]

x=[1 1 1 1 1]
for k=1:m
T(k)=(x(1)+x(2)*sin(N(k))+x(3)*cos(N(k)))/(1+x(4)*C(k)+x(5)*C(k)*C(k));printf("%f ",T(k))
end
