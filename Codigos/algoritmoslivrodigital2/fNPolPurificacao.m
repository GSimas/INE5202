function [x M k dif]=fNPolPurificacao(n,a,xi,tolerancia,M)
dif=1;k=0;
while(dif>tolerancia && k<120)
k=k+1;
    R=fBriotRuffini(n,a,xi);
    dx=-R(M)/(R(M+1)*M);
    x=xi+dx;
    xi=x;
    dif=abs(R(1))+abs(dx);
end
end