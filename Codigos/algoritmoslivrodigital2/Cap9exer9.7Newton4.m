%Problema de valor no contorno Exercicio 9.7
%F''''+6x^(-4)=0 com solução exata F(x)=ln(x)
clear
clc
format long
a=1  % Valor inicial de x
b=2  % Valor final de x do cominio de calculo
% Condição Inicial:
x(1) =a;  % Valor inicial de x
y1(1)=0; % Valor inicial de y1
y2(1)=1; % Valor inicial de y2

%%-----------------------------------------------------------------------------
%determinação das 2 Condições iniciais desconhecidas
%y3(1)=C(1)=?; % Valor inicial (C.I.) de y3 "desconhecido"
%y4(1)=C(2)=?; % Valor inicial (C.I.) de y4 "desconhecido"

%y1(n+1)=ln(2) % Valor final(C.C.) de y1 "conhecido" = D(1)
%y2(n+1)=0.5   % Valor final(C.C.) de y2 "conhecido" = D(2)
D(1)=log(2);
D(2)=0.5
%RK4 p/ sistemas de 4 EDOs
%Vamos estabelecer o n mínimo para que a solução y1 tenha erromaximo<tolerancia
n=2^12  % Numero de subdivisões do intervalor [a,b] por tentativas
tolerancia=1e-14%para que erro maximo seja 1e-6 na solução final F.
%via metodo de Newton numerico para deternimar C(1) e C(2) das eqs. 
%h1(C1)=y1(n+1)-D1=0 
%h2(C2)=y1(n+1)-D2=0 
Ci=[0 0] %valores iniciais das CI's y3(1)=C(1)=? e y4(1)=C(2)=?
C=fNewtonNumC4(n,a,b,x,y1,y2,Ci(1),Ci(2),D,tolerancia)%h(C)=f(C)-D=0 
%%-----------------------------------------------------------------------------

%Adotando o valor de C determinado acima por um dos metodos, continuamos a solucao
y3(1)=C(1);%ultimo valor calculado de C é o correto p/ y3(1), mas ainda depende de n. 
y4(1)=C(2);%ultimo valor calculado de C é o correto p/ y4(1), mas ainda depende de n. 
[x y1 y2 y3 y4]=fRK4sist4(n,a,b,x,y1,y2,y3,y4);
ye=log(x);%Valor exato p/ comparação
[erroFexatomax1 i]=max(abs(y1.-ye)) %Erro exato maximo em todo o dominio de x (para aferição)
posicaoerroFexatomax=x(i)
[xa y1a y2a y3a y4a]=fRK4sist4(2*n,a,b,x,y1,y2,y3,y4); %valor mais proximo dom exato
erroFestimmax2=abs(y1(n/2+1)-y1a((2*n/2)+1)) %Erro estimado no meio intervalo.
%% algoritmo de busca opcional

plot(x,ye,'..k',x,y1,'-r')
