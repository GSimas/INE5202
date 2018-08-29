clear
clc
% Algoritmo de Cholesky
%Matriz de coeficientes simétrica, positiva definida, de ordem n x n
n=3 % numero de equaçoes
A=[[ 4  -1     1    ];
   [-1  +4.25  2.75 ];
   [ 1   2.75  3.5  ]; ]
%Matriz de m vetores de termos independentes b:
m=1%Equivale a um dos m sistemas diferentes, com a mesma matriz A
b=[ [ 0];
    [ 1];
    [-1]; ]
Ao=A; bo=b;
x=fLUCholesky(n,A,b)
r=fresiduos(n,[Ao,bo],x)