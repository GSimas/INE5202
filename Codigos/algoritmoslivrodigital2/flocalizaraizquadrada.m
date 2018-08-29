function x0=flocalizaraizquadrada(C)
NExp=fNExp(C);%determina exponte de C
M=C/10^(NExp);
%2p+q=NExp;
p=floor(NExp/2);%menor inteiro
q=mod(NExp,2);%resto inteiro
% q=1; 	%Impar
%	q=0;  %Par
x0=(1.68-1.29/(0.84+M))*10^p*3.16^q;
end