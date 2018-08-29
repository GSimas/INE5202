function y=fx2(t,a,b)
  %y=log(x+1)*x;
  %y=log(0.5.*(b.-a)*t.+0.5.*(b.+a));
  y=exp(0.5.*(b.-a)*t.+0.5.*(b.+a));
end