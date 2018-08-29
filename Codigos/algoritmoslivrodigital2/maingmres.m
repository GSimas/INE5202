% Algoritmo de eliminação Gaussiana com pivotação parcial e total, em liguagem do Octave (Matlab):
clc
clear
format long
n=5
Ao = [  0.448  0.832  0.193  1.  1.   2.;   %linha i=1
        0.421  0.784 -0.207  0.  1.   4.;   %linha i=2
       -0.319  0.884  0.000  0.  1.   5.;   %linha i=3
       -0.318  0.885  0.001  1.  1.   0.1;  %linha i=4
        0      0      0      0   1e3 1e3;   % linha extra
    ];

A=Ao(1:n,1:n);
b=Ao(1:n,n+1);

%Escalonamento com pivotação parcial
xgausspivparcial=fgausspivparcial(n,Ao)
Rgausspivparcial=fresiduosAb(n,A,b,xgausspivparcial) %função calculo de residuos das eqs. originais

%Escalonamento com pivotação total
xgausspivtotal=fgausspivtotal(n,Ao) % função triangularização e retrosubtituição, recebe n e A e retorna a solução x
Rgausspivtotal=fresiduosAb(n,A,b,xgausspivtotal) %função calculo de residuos das eqs. originais

%Metodo Octave
xOctave=A \ b
ROctave=fresiduosAb(n,A,b,xOctave) %função calculo de residuos das eqs. originais

%Generalized minimal residual method
xgmres(1:n)=1.;;xgmres=transpose(xgmres)
max_iterations=10
threshold=1e-14
[xgmres, e] = gmres( A, b, xgmres, max_iterations, threshold)
Rgmres=fresiduosAb(n,A,b,xgmres) %função calculo de residuos das eqs. originais
