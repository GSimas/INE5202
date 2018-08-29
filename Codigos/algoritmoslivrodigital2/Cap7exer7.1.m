clear
clc
m=6;
T=[ 0.2    0.4    0.6    0.8   0.9   1.0  ];
V=[ 0.04   0.14   0.30   0.45  0.61  0.69 ];
% Ajuste DIRETO para determinação de coeficientes não lineares de funções ajustadas
% V(T)=ln(a + b*T^2)
xi=[0.01   0.01]
s=fNewton2h(xi);
a=s(1)
b=s(2)
%Desvio local D=abs((a+b*T(k)^(-2))^(-1)- V(k))
D=abs(log(a+b.*T.^2).-V)
%Coeficiente de Determinação:
ym=0;    for k=1:m ym=ym+V(k);                        end 
ym=ym/m;
soma1=0; for k=1:m soma1=soma1+(log(a+b*T(k)^2)-ym)^2; end
soma2=0; for k=1:m soma2=soma2+(V(k)           -ym)^2; end
R1=soma1/soma2

np=100;
Tp=T(1):(T(m)-T(1))/np:T(m);
Vp=log(a.+b.*Tp.^2);
%Interpolação polinomial de grau n=m-1=4
n=m-1
difdiv1=fdifdiv(n,T,V); %vetor com diferenças no ponto i = 1	ye = sin(xp); %valores exatos
yip=fgregoryn(n,T,V,difdiv1,Tp); %y interpolado para cada xp(i)
plot(T,V,'*','markersize',20,Tp,Vp,'-k','LineWidth',2,Tp,yip,'--b','LineWidth',2)
legend('Dados experimentais','V(T)=ln(a + b*T^2)','V(T)=P4(T) interpolacao polinomial n=4','location','north')
grid on
