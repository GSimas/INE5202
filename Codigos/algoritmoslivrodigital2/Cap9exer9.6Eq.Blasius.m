clear
clc
format long

% Montando o sistema de EDOs para a equação de Blasius
% y1'(x)=z1(x,y1,y2,y3)= y2            = F(x)
% y2'(x)=z2(x,y1,y2,y3)= y3            = F'(x)
% y3'(x)=z3(x,y1,y2,y3)=((-0.5)*y1*y3) = F"(x)
% y1(0)= F (0)
% y2(0)= F'(0)
% y3(0)= F"(0) = C a ser calculado pelo metodo do 'shooting method'

a=0;
b=10;
% Condicoes iniciais em x=a=0
x(1)=0;
y1(1)=0;
y2(1)=0;
%y3(0)=C  valor desconhecido, mas sabemos y2(n+1)=y2(10)=D=1
tol=1e-8;

n=128;
%Conhecida condicao de contorno em x=b=10
D=1
y2(n+1)=D;


%item a) determinar C via shooting method
Ci=0.; %valor inicial da CI desconhecida
C=fCalculaCshooting3(n,a,b,x,y1,y2,Ci,D,tol)
%item a) determinar C via Newton
Ci=0.; %valor inicial da CI desconhecida
C=fNewtonNumC3(n,a,b,x,y1,y2,Ci,D,tol)%f(C)=F(C)-D=0 



%item b graficos da solução
y3(1)=C; %Definido o valor da Condição inicias, pode-se resolver a EDO
[x y1 y2 y3]=fRK4sis3(n,a,b,x,y1,y2,y3);

%item c graficos da solução
[xa y1a y2a y3a]=fRK4sis3(2*n,a,b,x,y1,y2,y3);
ErroEstimado1=abs(y1(n+1)-y1a(2*n+1))     %erro na extremidade x=b
ErroEstimado2=abs(y1(n/2+1)-y1a(2*n/2+1)) %erro no meio do intervalo x=(a+b)/2

plot(x,y1,"linewidth",2,"--r;y1;",x,y2,"linewidth",2,"-k;y2;",x,y3,"linewidth",2,"..b;y3;")
