function a = fdetcoefTV(m,T,V)
%y=y+(x(1)*T(k)+x(2)*cos(T(k))-V(k))*T(k);
A(1,1)=0;for k=1:m A(1,1)=A(1,1)+T(k)^2;          end
A(1,2)=0;for k=1:m A(1,2)=A(1,2)+T(k)*cos(T(k));  end
B(1)=0;  for k=1:m B(1)  =B(1)  +T(k)*V(k);       end
%y=y+(x(1)*T(k)+x(2)*cos(T(k))-V(k))*cos(T(k));
A(2,1)=A(1,2); %simetrico
A(2,2)=0;for k=1:m A(2,2)=A(2,2)+(cos(T(k)))^2;   end
B(2)=0;  for k=1:m B(2)  =B(2)  +V(k)*cos(T(k));  end
[A transpose(B)]
a = fCholesky(2,A,B); %Cholesky:se A é positiva definida, senaofgauss(2,[A transpose(B)])
end
