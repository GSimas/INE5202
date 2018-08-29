%Algoritmos Iterativos: Iteração Linear, Newton e Newton Com derivadas numéricas (secante)
clear
clc
format long
%Valores iniciais do intervalo que contém uma raiz:
a=2
b=3
xi=0.5*(a+b)
tol=1e-14
printf("\n Metodo da Iteracao Linear\n")
x=fMIL1(xi,tol);
printf("\n\n Metodo de Newton")
x=fNewton(xi,tol);
printf("\n\n Metodo de Newton com derivadas numericas (secante)")
x=fNnumerico(xi,tol);
printf("\n\n Metodo da Secante puro")
x=fNSecante(xi,tol);