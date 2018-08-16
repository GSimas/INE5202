function root = root(a,b)

k = 0;
erro = 10^-5;
fa = exp(a)*sin(a)-1;
fb = exp(b)*sin(b)-1;
fxm = 10;

while(abs(fxm) > erro)
    k = k + 1;
    xm = (a+b)/2;
    fxm = exp(xm)*sin(xm)-1;
    if (fa*fxm<0)
        b = xm;
    else
        a = xm;
        fa = fxm;
    end
end
root = xm;