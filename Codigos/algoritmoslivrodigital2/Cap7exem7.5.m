clear
clc
format long
%Ajuste: V(T)=(a+b*T^(-2))^(-1) 
m=5
T= [0.2   0.4   0.6   0.8   1.0  ]
V= [0.04  0.14  0.26  0.39  0.50 ]

%1. Ajuste de funções não polinomiais: V(T)=(a+b*T^(-2))^(-1) com TRANSFORMAÇÃO para forma polinomial
% V     =(a+b*T^(-2))^(-1)
% V^(-1)= a   + b *T^(-2)
%     y = a1+ a2*x   
x=T.^(-2);
y=V.^(-1);
n=1;
coef = fdetajustePn(n,m,x,y) %ajuste polinomial 
%Voltando para o Problema não Polinomial, no caso linear
a=coef(1)
b=coef(2)
%raiz quadrada do desvio quadrático médio RMSD=sqrt(1/m*((a+b*T(k)^(-2))^(-1)-V(k))^2)
D1=0;
for k=1:m
  res1(k)=(a+b*T(k)^(-2))^(-1)-V(k);
	D1=D1+res1(k)^2;
end
RMSD1=sqrt(D1/m)
%Coeficiente de Determinação:
ym=0;    for k=1:m ym=ym+V(k);                        end 
ym=ym/m;
soma1=0; for k=1:m soma1=soma1+((a+b*T(k)^(-2))^(-1)-ym)^2; end
soma2=0; for k=1:m soma2=soma2+(V(k)                -ym)^2; end
R1=soma1/soma2
Tp1=T(1):(T(m)-T(1))/100:T(m);
Vp1=(a.+b.*Tp1.^(-2)).^(-1);

%2. Ajuste DIRETO para determinação de coeficientes não lineares de funções ajustadas
xi=[0.01   0.01]
s=fNewton2g(xi);
a=s(1)
b=s(2)
%raiz quadrada do desvio quadrático médio RMSD=sqrt(1/m*((a+b*T(k)^(-2))^(-1)-V(k))^2)
D2=0;
for k=1:m
  res2(k)=(a+b*T(k)^(-2))^(-1)-V(k);
	D2=D2+res2(k)^2;
end
RMSD2=sqrt(D2/m)
%Coeficiente de Determinação:
ym=0;    for k=1:m ym=ym+V(k);                        end 
ym=ym/m;
soma1=0; for k=1:m soma1=soma1+((a+b*T(k)^(-2))^(-1)-ym)^2; end
soma2=0; for k=1:m soma2=soma2+(V(k)                -ym)^2; end
R2=soma1/soma2

Tp2=T(1):(T(m)-T(1))/100:T(m);
Vp2=(a.+b.*Tp2.^(-2)).^(-1);
%plot(T,V,'*k','markersize',20,Tp1,Vp1,'--k','LineWidth',2,Tp2,Vp2,'-k','LineWidth',2)
%legend('Dados experimentais','V(T)=ajuste transformado para polinomial n=1','V(T)=ajuste direto, funcao original','location','north')

%Valores medios dos residuos (desvios locais):
mediaresiduos1=sum(res1)/m
mediaresiduos2=sum(res2)/m
plot(T,res1,'ok','markersize',10,T,res2,'sk','markersize',10,[T(1) T(m)],[0 0],'k')
%legend('Residuos do ajuste transformado para polinomial n=1','Residuos do ajuste direto','location','north')
%grid on