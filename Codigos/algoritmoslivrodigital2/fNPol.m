function [x M k dif]=fNPol(n,a,xi,tolerancia)
Rlim= fRlimite(n,a) %
%Rlim=0.1
%Rlim=0.1  %ESte pode ser escolhido, conforme o polinômio
dif=1;k=0;
while(dif>tolerancia && k<120)
k=k+1;
    R=fBriotRuffini(n,a,xi);
    M=fmultiplicidade(n,a,R,Rlim);
    dx=-R(M)/(R(M+1)*M);
    x=xi+dx;
    xi=x;
    dif=abs(R(1))+abs(dx);
end
end