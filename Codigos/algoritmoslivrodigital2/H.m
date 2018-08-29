function Erro=H(n,a,b,x,y1,y2,y3,y4,D)
%y3(1)=C(1)=?; % Valor inicial (C.I.) de y3 "desconhecido"
%y4(1)=C(2)=?; % Valor inicial (C.I.) de y4 "desconhecido"
    [x y1 y2 y3 y4]=fRK4sist4(n,a,b,x,y1,y2,y3,y4); %resolve o sistema 
%y1(n+1)=ln(2) % Valor final(C.C.) de y1 "conhecido" = D(1)
%y2(n+1)=0.5   % Valor final(C.C.) de y2 "conhecido" = D(2)
%y1(n+1)= alvo atingido p/ y1
%y2(n+1)= alvo atingido p/ y2
    Erro(1)=y1(n+1)-D(1);
    Erro(2)=y2(n+1)-D(2);
end
