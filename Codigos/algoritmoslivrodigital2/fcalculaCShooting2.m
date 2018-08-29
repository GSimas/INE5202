function C=fcalculaC2Shooting2(n,a,b,x,y1,Ci,D,tolerancia)
%1ª estimativa
C1=Ci; %valor inicial
C2=C1+0.1;
%Dado C1  Processo iterativo:
y2(1)=C1; % Valor inicial de y2 "desconhecido", atribuido
[x y1 y2]=fRK4sist2(n,a,b,x,y1,y2);
D1=y1(n+1); %valor incicial de D1
cont=0;
while abs(C2-C1)>tolerancia && cont<15
  cont=cont+1; %contador limite de segurança
  %Dado C2 - Processo iterativo:
  y2(1)=C2; % Valor inicial de y2 desconhecido, atribuido
  [x y1 y2]=fRK4sist2(n,a,b,x,y1,y2);
  D2=y1(n+1);
  C=C1+(C2-C1)*(D-D1)/(D2-D1);
  %atualização de valores de C1 e C2:
  C1=C2;D1=D2; %(descarta C1, substitui por C2)
        %valor de D1 nao precisa ser recalculado, pois é o proprio D2
  C2=C;    %(atualiza C2 com o novo C)
  %Atualizados C1 e C2 - Processo iterativo para recalcular D2:
end
cont
abs(C2-C1);
end
