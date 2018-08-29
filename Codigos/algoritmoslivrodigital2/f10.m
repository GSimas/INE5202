function Erro=f10(n,a,b,x,y1,y2,C1,D)
y3(1)=C1; % Valor inicial de y3 "desconhecido", atribuido
[x y1 y2 y3]=fRK4sis3(n,a,b,x,y1,y2,y3);
%y2(n+1) correto é D
%y2(n+1) alvo atingido 
Erro=y2(n+1)-D; %Erro(C)=D1-D
end