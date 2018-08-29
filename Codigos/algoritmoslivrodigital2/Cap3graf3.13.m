xp=-1.15:0.01:1.7;
yp=(xp+1).^2.*(xp-0.9).^6;
plot(xp,yp,'-k','linewidth',3)