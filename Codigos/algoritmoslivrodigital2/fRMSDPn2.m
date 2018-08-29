function [RMSD M]=fRMSDPn2(n,a,m,x,y)
D=0;
for k=1:m
  res(k)=(fPnH(n,a,x(k))-y(k));
	D=D+res(k)^2;
end%for
RMSD=sqrt(D/m);
M=sum(res)/m;
end
