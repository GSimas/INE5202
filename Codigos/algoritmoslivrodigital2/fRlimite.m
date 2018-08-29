function Rlim= fRlimite(n,coef)
menordif=fmenordif(n,coef);
Rlim1=0.1*menordif; %0.1*min(diferenças entre a(i))
if (Rlim1<eps)Rlim1=0.1; end %se Rlim1 é nulo => Rlim1=0.1
Ndecimais=fNdecimais(n,coef); %numero maximo de digitos decimais fracionarios nos coeficientes
Rlim2=1./10^Ndecimais; % Limite equivalente ao maximo numero de digitos significativos  dos coeficientes 
Rlim=max(Rlim1*Rlim2,1e-7);%Limitado a 1e-8 (metade da precisao double
end