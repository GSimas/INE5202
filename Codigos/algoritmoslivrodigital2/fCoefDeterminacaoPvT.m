function R2=fCoefDeterminacaoPvT(a,b,m,R,P,v,T)
%valor médio
ym=0;    for k=1:m ym=ym+P(k);                        end 
ym=ym/m;
SQT=0; for k=1:m SQT=SQT+(P(k)-ym                      )^2; end
SQE=0; for k=1:m SQE=SQE+(P(k)-funcaoP(a,b,R,v(k),T(k)))^2; end
R2=1-SQE/SQT;
end