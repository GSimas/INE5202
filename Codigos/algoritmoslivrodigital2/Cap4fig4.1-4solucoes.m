x1a=-3:0.01:+3;
x2a=+sqrt(9.-x1a.*x1a);
x2b=-sqrt(9.-x1a.*x1a);
x1c=-4:0.1:+4;
x2c=1./x1c;
sx=[ 2.981 0.3355 -0.3355 -2.981]; sy=[0.3355 2.981 -2.981 -0.3355];
plot(sx,sy,'*k','markersize',20,'linewidth',2,x1a,x2a,'-k','linewidth',3,x1a,x2b,'-k','linewidth',3,x1c,x2c,'--k','linewidth',3)
axis([-4 +4 -4 +4])
%xlabel ("x1");
%ylabel ("x2");
