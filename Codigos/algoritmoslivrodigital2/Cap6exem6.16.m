clear
clc
%f(x)=ln(x), x pertencente [0.001, +1], regiao crítica e próxima do ponto de descontinuidade, x=0
xa = +0.001
xb = +1.000
%mudança de variaveis para t pertencente [-1, +1]
%fx1(t)=log(0.5.*(xb.-xa).*t+0.5.*(xb.+xa))
a=-1;
b=+1;
%Comparativo entre aproximações de Padé:
np = 400; %intervalos para plotagem
tp=a:(b-a)/np:b;
ye = fx1(tp,xa,xb);

%aproximação por serie de Maclaurin para vPadé
npade = 2^6
mpade = 2^6 %atinge o erro máximo limite O(1e-7).
M = npade + mpade;
cM=fcoefMaclaurin2(M,xa,xb);

%aproximação racional de padé %Rnm = Pn(x)/Qm(x)
[aa bb]=fPade(npade,mpade,cM);
ypade= fPnH(npade,aa,tp)./fPnH(mpade,bb,tp);
Epade=abs(ypade.-ye);EpadeMax=max(Epade)

%podemos retornar apenas o valor xp=x(tp) para plotar os graficos das funções avaliadas em tp:
xp=0.5.*(xb.-xa).*tp+0.5.*(xb.+xa);

plot(xp,log10(Epade),"-k; Erro Pade;",'linewidth',2)
legend('location','north')
