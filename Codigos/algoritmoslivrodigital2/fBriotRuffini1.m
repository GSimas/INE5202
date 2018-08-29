function y=fBriotRuffini1(n,a,x)
for ip=1:length(x) %calcula y p/ cada elemento de x
    %nucleo do briot ruffini
    b(1)=a(1);
    for i=2:n+1
        b(i)=a(i)+x(ip)*b(i-1);
    end
    y(ip)=b(n+1);
    %nucleo do briot ruffini
end
end