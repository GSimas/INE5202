%x=-1:0.01:+1;
%y=1./x;
x=0:0.01:+pi/2-0.1;
y=tan(x);
x2=pi/2+0.1:0.01:3*pi/2-0.1;
y2=tan(x2);
xx=0:0.1:5;yy=zeros(51);
plot(x,y,'k','linewidth',3,x2,y2,'k','linewidth',3,xx,yy,'-k')
xlabel ("x");
ylabel ("y");
grid on