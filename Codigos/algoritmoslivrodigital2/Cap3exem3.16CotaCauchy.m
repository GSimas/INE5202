x=0
for k=1:33
k
xn=((4*x^3+2*x^2+6)/3)^(1/6)
dif=abs(xn-x)
x=xn;
end