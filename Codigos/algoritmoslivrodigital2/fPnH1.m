function y=fPnH1(n,a,x)
%Pn(xi)=a(1)*x^n+a(2)*x^(n-1)+a(3)*x^(n-2)+...+a(n)*x+a(n+1)
%Pn(xi)=((...(a(1)*x+a(2))*x+a(3))*x+...+a(n))*x+a(n+1) % HORNER 1 (ordem decrescente de grau)
for ip=1:length(x) %calcula y p/ cada elemento de x
  y(ip)=a(1);
  for i=2:n+1
      y(ip)=a(i)+y(ip)*x(ip);
  end
end
end