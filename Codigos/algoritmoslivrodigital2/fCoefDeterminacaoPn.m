function R2=fCoefDeterminacaoPn(n,a,m,x,y)
%valor médio
ym=0;  for k=1:m ym=ym+y(k);                      end 
ym=ym/m;
SQE=0; for k=1:m SQE=SQE+(fPnH(n,a,x(k))-y(k))^2; end %soma do quadrado dos residuos
SQT=0; for k=1:m SQT=SQT+(ym            -y(k))^2; end %soma dos quadrados totais
R2=1-SQE/SQT; %coeficiente de determinação simplificado
end