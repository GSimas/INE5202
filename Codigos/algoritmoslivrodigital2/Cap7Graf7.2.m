clear
clc
a=0;b=4;
x=[ 1 1 3]
y=[ 1 3 2]
%g1
xp=a+0.5:0.05:b-0.5;
for i=1:length(xp) yp(i)=y(3); end
%g2
x2=[0.5   3.5];
y2=[1.125 3.375];

plot(x,y,'*k','markersize',20,'LineWidth',2,xp,yp,'--k','LineWidth',4,x2,y2,'-k','LineWidth',2)
xlim([a b])
ylim([a b])
grid on
%grid minor