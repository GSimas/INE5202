clear
clc
%Matriz de coeficientes de ordem n x n
n=4 % numero de equaçoes
A=[	 1  2  3  4 ;
	   1  2 -3 -4 ;
	  -1  0  2  3 ;
	   1 -4 -1  1 ;  ]
%Matriz de m vetores de termos independentes b:
m=3%Equivale a 3 sistemas diferentes, com a mesma matriz A e
% 3 vetores b de termos independentes concatenados e
% armazenados nas 3 colunas de B;
B=[	1  1 -1 ;
	  0  0  0 ;
	  1  1  1 ;
	  2 -2  2 ;  ]
Ao=A; Bo=B; %valores originais para avaliacao dos residuos
%Decomposicao LU de Crout armazenada em matriz unica A (L\U) e B pivotado
[A B]=fLUCrout(n,A,m,B)
% Resolvendo os m sistemas, para o termo independente t=1:m
for t=1:m
   t
   x=fsubstituicaoLU(n,A,B(:,t))  %determina c e x para cada b
   R=fresiduosLU(n,Ao,Bo(:,t),x)  % avalia os residuo maximo das equacoes
end %k
