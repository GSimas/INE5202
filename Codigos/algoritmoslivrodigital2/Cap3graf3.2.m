clear
clc
xp=-1:0.1:1.5;
yp=exp(xp).*sin(xp)-1;
plot(xp,yp,'-k','linewidth',3,[-1 +1.5],[0 0],'k','linewidth',1,[0 0],[-2 4],'k','linewidth',2)
grid on