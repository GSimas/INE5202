function Sn=fSn(n,a,b)
  %n obrigatoriamente par
  h=(b-a)/n;
  t=a:h:b;
  y=f(t);
  soma1=0;
  soma2=0;
  for i=2:2:n
    soma1=soma1+y(i);
  end %for i
  for i=3:2:n-1
    soma2=soma2+y(i);
  end %for i
  Sn=(h/3)*(y(1)+y(n+1)+4*soma1+2*soma2);  
end %function