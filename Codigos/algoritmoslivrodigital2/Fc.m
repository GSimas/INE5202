function  Y=Fc(w)

[m I H F] = dados;

w(3) = 0.001;

Y(1)=0;for i=1:m Y(1)=Y(1)+(I(i)^w(1)/1000-w(2)*H(i)^w(3)-F(i))*w(1)*I(i)^(w(1)-1); end
Y(2)=0;for i=1:m Y(2)=Y(2)+(I(i)^w(1)/1000-w(2)*H(i)^w(3)-F(i))*H(i)^w(3); end

end