function zt=fGregory2D(n,x,m,y,z,xt,yt)
for ip=1:length(xt) %calculo em todos os pontos (xt(ip),yt(ip),zt(ip))
%Fixa cada x(i) colocados nas colunas:
for i=1:n+1
% Interpolação polinomial de Gregory Newton
difdiv1=fdifdiv(m,y(:),z(:,i)); %vetor com diferenças no ponto j = 1
zi(i)=fgregoryn(m,y(:),z(:,i),difdiv1,yt(ip));%zi aproximado para x(i) em yt
end
difdiv1=fdifdiv(n,x(:),zi(:)); %vetor com diferenças no ponto i = 1 
zt(ip)=fgregoryn(n,x(:),zi(:),difdiv1,xt(ip)); %zt aproximado para xt
end
end