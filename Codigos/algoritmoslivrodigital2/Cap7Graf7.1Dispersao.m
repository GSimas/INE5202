clear
clc
x1=0:0.1:+3;
for i=1:length(x1)
   y1(i)=2.*(x1(i).-1).*(x1(i).-2).+0.5.*sign(unifrnd(-x1(i),x1(i)))*rand;
end
x=0:0.01:+3;
y=2.*(x.-1).*(x.-2);;
plot(x1,y1,'k*','markersize',10,x,y,'-k','linewidth',2)
%legend ('dados com ruido','tendencia g(x)','location','north')
%grid on