x=-1:0.01:+1;
y=1./x;
xx=-1:0.1:1;yy=zeros(21);
plot(x,y,'k','linewidth',3,xx,yy,'-k')
axis([-1 +1 -40 +40])
xlabel ("x");
ylabel ("y");
grid on