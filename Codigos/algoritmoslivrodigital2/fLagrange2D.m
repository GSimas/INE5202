function f = fLagrange2D(n,x,m,y,z,xt,yt)
somapesosx=0;somapesosy=0;
for ip=1:length(xt) %calculo em todos os pontos (xt(ip),yt(ip),zt(ip))
  f(ip)=0;
%fatores pesox e pesoy podem ser armazenados previamente para uma distribuição fixa de pontos
  for i=1:n+1
    numx=1.;denx=1.;	
    for k=1:n+1
      if (k != i) 
        numx=numx*(xt(ip)-x(k));
        denx=denx*( x(i )-x(k));
      end %if
    end%for k
    pesox(i)=numx/denx;           
  end%for i

  for j=1:m+1
    numy=1.;deny=1.;
    for k=1:m+1
      if (k != j) 
        numy=numy*(yt(ip)-y(k));
        deny=deny*( y(j )-y(k));
      end %if
    end%for k
    pesoy(j)=numy/deny;
  end%for j

  for i=1:n+1
    for j=1:m+1
      f(ip)=f(ip)+z(j,i)*pesox(i)*pesoy(j);
    end%j
  end%i
end%ip
end%function