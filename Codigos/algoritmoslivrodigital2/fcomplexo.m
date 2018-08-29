function complexo=fcomplexo(n,coef)
complexo=0;
for i=1:n+1 if(imag(coef(i))~=0)complexo=1; end end %detecta coef complexos =1
end