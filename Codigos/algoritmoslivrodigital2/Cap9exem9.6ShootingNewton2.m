%Problema de valor no contorno
clear
clc
format long
a=0  % Valor inicial de x
b=1  % Valor final de x do cominio de calculo
% Condição Inicial:
x(1) =a;  % Valor inicial de x
y1(1)=0; % Valor inicial de y1

%%-----------------------------------------------------------------------------
%y2(1)=?; % Valor inicial (C.I.) de y2 "desconhecido" =C
%y1(n+1)=9.389056098930666 % Valor final(C.C.) de y1 "conhecido" =D
D=9.389056098930666
%RK4 p/ sistemas de 2 EDOs
tolerancia=1e-6;%erro maximo 1e-6
%Vamos estabelecer o n mínimo para que a solução y1 tenha erromaximo<tolerancia
n=18  % Numero de subdivisões do intervalor [a,b] para que o Erro<1e-6 (por tentativas)

%1a. tentativa via Shooting Method
Ci=0.1; %valor inicial da CI desconhecida
'via shooting method'
C=fcalculaCShooting2(n,a,b,x,y1,Ci,D,tolerancia) %Shooting Method
%2a. tentativa via metodo de Newton numerico para deternimar C da eq. F(C)=D1(C)-D=0 
Ci=0.1; %valor inicial da CI desconhecida
'via metodo de Newton resolvendo a eq. do erro'
C=fNewtonNumC2(n,a,b,x,y1,Ci,D,tolerancia)%f(C)=F(C)-D=0 
%%-----------------------------------------------------------------------------

%Adotando o valor de C determinado acima por um dos metodos, continuamos a solucao
y2(1)=C;%ultimo valor calculado de C é o correto p/ y2(1), mas ainda depende de n. 
[x y1 y2]=fRK4sist2(n,a,b,x,y1,y2);
ye=2.*x.*x.+x.*exp(2.*x);%Valor exato p/ comparação
[erroexatomax1 i]=max(abs(y1.-ye)) %Erro exato maximo em todo o dominio de x (para aferição)
posicaoerroexatomax=x(i)

C=fNewtonNumC2(2*n,a,b,x,y1,Ci,D,tolerancia)%f(C)=F(C)-D=0 
y2(1)=C;
[xa y1a y2a]=fRK4sist2(2*n,a,b,x,y1,y2); %valor mais proximo dom exato
erroestimmax2=abs(y1(n/2+1)-y1a((2*n/2)+1)) %Erro estimado no meio intervalo.
erroestimmax3=max(abs(y1  .-y1a(1:2:2*n+1))) %Erro estimado a partir de todos os pontos dicretos

plot(x,ye,'*',x,y1,'r')
