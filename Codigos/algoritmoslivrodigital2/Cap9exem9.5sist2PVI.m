clear
clc
a=0  % Valor inicial de x
b=1  % Valor final de x do cominio de calculo
% Condição Inicial:
x(1) =a;  % Valor inicial de x
y1(1)=0; % Valor inicial de y1
y2(1)=1; % Valor inicial de y2

%RK4 p/ sistemas de 2 EDOs
n=43  % Numero de subdivisões do intervalor [a,b] para que o Erro<1e-6
[x y1 y2]=fRK4sist2(n,a,b,x,y1,y2);
[ transpose(x)  transpose(y1) transpose(y2) ]%transpose(1:length(x))
ye=2.*x.*x.+x.*exp(2.*x);%Valor exato p comparação
erroexatomax1=max(abs(y1.-ye))     %Erro exato do intervalo (aferição)
erroexatomax2=abs(y1(n+1)-ye(n+1)) %Erro no final no intervalo, no ultimo ponto
[xa y1a y2a]=fRK4sist2(2*n,a,b,x,y1,y2);
erroestimmax3=abs(y1(n+1)-y1a(2*n+1)) %Erro estimado no final no intervalo, no ultimo ponto
plot(x,y1,'k*',x,ye,'-k')
xlim([0,1.1])
%grid on