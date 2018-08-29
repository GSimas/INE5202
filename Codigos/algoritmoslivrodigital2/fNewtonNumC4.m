function C=fNewtonNumC4(n,a,b,x,y1,y2,y3,y4,D,tol)%Método da Newton NUmerico:
%Para 2 eqs nao lineares
Xi(1)=y3(1); %Ci(1) condicao inicial desconhecida p/ y3
Xi(2)=y4(1); %Ci(2) condicao inicial desconhecida p/ y4
criterio=1;contador=0;
for i=1:2 Dx(i)=1e-6; end
while (criterio>tol && contador<50)
    contador=contador+1;
    %Gerando a jacobiana
    Xj=Xi;
    y3(1)=Xi(1); %Ci(1) condicoes iniciais desconhecidas
    y4(1)=Xi(2); %Ci(2) condicoes iniciais desconhecidas
    Yi=H(n,a,b,x,y1,y2,y3,y4,D); %Valor inicial

    for j=1:2 %varre as 2 colunas
        Xj(j)=Xi(j)+Dx(j); %incremento só na coluna j
        y3(1)=Xj(1); %condicao incrementada p/ y3 qdo j=1
        y4(1)=Xj(2); %condicao incrementada p/ y4 qdo j=2
%            for i=1:n
                Yj=H(n,a,b,x,y1,y2,y3,y4,D);
                A(:,j)=(Yj .- Yi)/Dx(j); 
%            end
            Xj=Xi;% volta ao valor original
    end
    A(:,2+1)=-Yi;
    Dx=fgausspivparcial(2,A);
    X=Xi+Dx;
    Xi=X;
    criterio=min(abs(Dx));
end
C=X;
contador
criterio
end