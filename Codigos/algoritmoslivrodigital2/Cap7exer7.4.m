format long
clear
clc
m=4
T = [ 0.00	0.39	0.78	1.18 ]
V = [ 0.99	0.92	0.71	0.38 ]

s= fdetcoefTV(m,T,V);
a=s(1)
b=s(2)
Tp=T(1):0.01:T(m);
Vajuste = a.*Tp.+b.*cos(Tp);
Vk=a.*T.+b.*cos(T);
D=abs(Vk.-V)

%plot(T,V,"*;Pontos experimentais;",'markersize',20,Tp,Vajuste,"-r;funcao ajustada, coeficientes lineares;")
bar(T,D,"b*;Desvios locais;")
