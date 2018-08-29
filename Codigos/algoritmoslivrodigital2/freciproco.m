%Algoritmo de Newton com o Recíproco de c
function x=freciproco(C)
%1/C=x=>? ; f(x)=C-1/x; f'(x)=-1/(x*x)
%x=xi-f(xi)/df(xi)  ; x=x-(C-1/x)/(1/(x*x))  ;  x=x*(2-x*C);
%Valor inicial grosseiro, mas tem convergência garantida
if(abs(C)>1) x=0+eps; else x=1+eps; end
%valor inicial escolhido,opcional
%x=0.001;
cont=0;dif=1;
while(dif>1.e-16 && cont<100)
   cont=cont+1;
   xi=x;
   x=x*(2-x*C);
   dif=abs(x-xi);
end
end