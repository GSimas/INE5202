function f=fgregoryn(n,x,y,difdiv1,xp)
for ip=1:length(xp)
    f(ip) = y(1);
    prod = 1;
    for k = 1:n
    	    prod = prod*(xp(ip)-x(k));
    	    f(ip)= f(ip)+difdiv1(k)*prod;
    end
end
end
