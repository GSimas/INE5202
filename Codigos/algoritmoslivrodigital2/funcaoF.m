function y=funcaoF(w);

[m I H F] = dados;
w(3) = 0.001;

for i=1:m y(i)=I(i)^w(1)/1000-w(2)*H(i)^w(3); end
end