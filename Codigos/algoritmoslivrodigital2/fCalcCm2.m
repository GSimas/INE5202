function C=fCalcCm2(M,t)
%dados valores de t(m,k):
%A=[
%    1          1         1         ... 1         2/1;
%    tm1        tm2       tm3       ... tmm       0  ;
%    tm1²       tm2²      tm3²      ... tmm²      2/3;
%    tm1³       tm2³      tm3³      ... tmm³      0  ;
%    tm1⁴       tm2⁴      tm3⁴       ... tmm⁴      2/5;
%    ...
%    tm1^(m-1)  tm2^(m-1) tm3^(m-1) ... tmm^(m-1) 0  ;
%  ]
C=zeros(M, M);
for m=1:M
  for i=1:m
      for j=1:m
          A(i,j)=t(m,j)^(i-1);
      end
  end
  b(m)=0;
  for i=1:2:m
      b(i)=(2/i);
  end
  A = [A transpose(b)]; 
  aux2 = fgausspivparcial(m, A);
  for k=1:m  C(m, k)=aux2(k); end %armazena na forma de matriz
end %m
end
