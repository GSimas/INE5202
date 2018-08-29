clear
clc
format long

[m I H F] = dados;

wi = [0.912425241 0.051990891]

w=fNewtonNnumFc(2,wi)
y=w(1)
k=w(2)
x=0.001



C=funcaoF(w);
desvioslocais=C.-F;
maxdesvio=max(abs(desvioslocais))
 plot((1:m),desvioslocais)
% plot((1:m),F,'b',(1:m),C,'k') %curva de calibração
[Iord, iord] = sort(I); 
%plot(Iord,F(iord),'.b',Iord,C(iord),'k')
%desviomedioP=sum(desvioslocais)/m  %media nula indica disribuição randomica de erros
%R2=fCoefDeterminacaoPvT(a,b,m,R,P,v,T)

% Construindo grafico3D da superficie P-v-T:
%fgrafico3D_exem7_3(m,v,T,P,R,1.,1.)
%fgrafico2D_exem7_3(m,v,T,P,R,a,b)
%grid on
