function root = root(a,b)

function f = f(x)
    f = exp(x)*sin(x)-1;
end

k = 0;
erro = 10^-5;
fa = f(a);
fb = f(b);
fxm = 10;

while(abs(fxm) > erro)
    k = k + 1;
    xm = (a+b)/2;
    fxm = f(xm);
    if (fa*fxm<0)
        b = xm;
    else
        a = xm;
        fa = fxm;
    end
end
root = xm;
end