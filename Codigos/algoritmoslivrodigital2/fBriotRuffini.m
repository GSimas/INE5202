function R=fBriotRuffini(n,a,xi)
N=n; %promove todas as n divisoes possiveis
for k=1:N
    %nucleo do briot ruffini
    b(1)=a(1);
    for i=2:n+1
        b(i)=a(i)+xi*b(i-1);
    end
    R(k)=b(n+1);
    %redefinindo o polinomio quociente
    n=n-1;
    a=b;
    %nucleo do briot ruffini
end
%ultima divisao
R(N+1)=a(1);
end