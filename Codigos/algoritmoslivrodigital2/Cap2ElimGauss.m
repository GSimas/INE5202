% Algoritmo de eliminação Gaussiana com pivotação parcial e total, em liguagem do Octave (Matlab):
clear
clc
format long
n=3;
A = [  0.448  0.832   0.193   1;  %linha i=1
	     0.421  0.784  -0.207   0;  %linha i=2
	    -0.319  0.884   0.000   0;  %linha i=3
    ];
Ao=A; %variavel auxiliar que guarda as equações originais do sistema
%Escalonamento com pivotação total
x=fgausspivtotal(n,A) % função triangularização e retrosubtituição, que 
	            % recebe n e A e retorna a solução x
R=fresiduos(n,Ao,x) %função calculo de residuos das eqs. originais
%Escalonamento com pivotação parcial
x=fgausspivparcial(n,A)
R=fresiduos(n,Ao,x) %função calculo de residuos das eqs. originais
