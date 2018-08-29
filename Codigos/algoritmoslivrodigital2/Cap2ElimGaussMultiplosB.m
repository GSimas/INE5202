% Algoritmo de eliminação Gaussiana com pivotação parcial e total, em liguagem do Octave (Matlab):
clear
clc
format long
n=4 % numero de equaçoes
A=[	 1  2  3  4 ;
	   1  2 -3 -4 ;
	  -1  0  2  3 ;
	   1 -4 -1  1 ;  ]
m=3%Equivale a 3 sistemas diferentes, com a mesma matriz A e
% 3 vetores b de termos independentes concatenados e
% armazenados nas 3 colunas de B;
B=[	1  1 -1 ;
	  0  0  0 ;
	  1  1  1 ;
	  2 -2  2 ;  ]
Ao=A; Bo=B; %valores originais para avaliacao dos residuos     
%Escalonamento com pivotação total
x=fgausspivtotalmB(n,A,m,B) % função triangularização e retrosubtituição, que 
	            % recebe n e A e retorna a solução x
R1=fresiduos(n,[Ao Bo(:,1)],transpose(x(:,1))) %função calculo de residuos das eqs. originais
R2=fresiduos(n,[Ao Bo(:,2)],transpose(x(:,2))) %função calculo de residuos das eqs. originais
R3=fresiduos(n,[Ao Bo(:,3)],transpose(x(:,3))) %função calculo de residuos das eqs. originais