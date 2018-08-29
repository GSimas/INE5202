function [x M]=froots2(a)
n=length(a)-1;
%Normalização de coeficientes pelo a(1), de maior grau
a(2:n+1)=a(2:n+1)/a(1); a(1)=1;
tolerancia=1e-12;
rn=0;r=0;x=[];M=[];
%0º verificando se tem raizes nulas:
if (abs(a(n+1))<tolerancia) %Verifica se o polinomio tem raízes nulas
  while (abs(a(n+1))<tolerancia) %Fatora o polinomio com raízes nulas, retirando os coeficientes nulos
     rn=rn+1;
     [n a]=fdivisao(n,a,0,1);%Reducao de grau 1 vez, para cada a(n+1) nulo
  end %while
  x(1)=0;M(1)=rn;%numero de raizes Nulas
  r=1; %indice para determinação das proximas raizes, após determinar as nulas
end %if
ni=n;ai=a(1:ni+1); %armazena o polinomio original, sem as raizes nulas, para o refinamento.
%1º localizacao de todas as raizes nao nulas e inclui a 1a. nula, x (se houver)
    xi=[x fLocaliza(n,a)]
%    xi=2.01
%    xi(1:n)=1.199
while(n>0) %Busca raizes, Enquanto n>0 
	r=r+1;
%2º Aproximacao com tolerancia controlado
    [x(r) M(r) k dif]=fNPol(n,a,xi(r),tolerancia); %usa apenas a raiz r localizada antes 
%3º Refinamento da raiz aproximada com tolerancia controlado, usando o polinômio original
    [x(r) M(r) k dif]=fNPolPurificacao(ni,ai,x(r),tolerancia,M(r));
%4º Reducao de grau M vezes
    [n a]=fdivisao (n,a,x(r),M(r));
end %voltar ao 2º passo, p/ a proxima raiz
for i=1:length(x)
if (sign(real(x(i)))==-1) char1='-'; else char1='+'; end
if (sign(imag(x(i)))==-1) char2='-'; else char2='+'; end
   printf("\n x = %c %.15f %c %.15f i  com M = %d",char1,abs(real(x(i))),char2,abs(imag(x(i))),M(i));
end
printf("\n");
end