xp=0:0.1:4;
yp=(xp).*log(xp)-3.2;
plot(xp,yp,'-k','linewidth',3,[0 +4],[0 0],'k','linewidth',2,[0 0],[-4 4],'k','linewidth',2)
grid on