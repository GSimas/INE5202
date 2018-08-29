%Algoritmos de partição: Bisseção, Falsa-Posição e Falsa-Posição modificada:
clear
clc
format long
%Valores iniciais do intervalo que contém uma raiz:
a=0
b=1
tol=1e-15
printf("\n Metodo da Bissecao")
x=fBissecao(a,b,tol);
printf("\n Metodo da Falsa-Posicao")
x=fFalsaposicao(a,b,tol);
printf("\n Metodo da Falsa-Posicao modificado")
x=fFalsaposicaoM(a,b,tol);