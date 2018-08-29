clear
clc
format long 
%a=[1 -3  +3 -1]
%a=[3 0 0 4 -2  0 -6] 
%a=[1 -2.5 0.36 3.024 -1.9008]%a=[1 -3.4 +2.35 4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441 0 0 0]
%a=[ 1 -7  +20.95 -34.75 +34.5004 -20.5012 +6.7512 -0.9504  0  0  0]
a=[1 -4.9 5.4 5.2 -8.8]
n=length(a)-1
printf("\n Raizes da funcao roots2 desenvolvida:\n")
[x M]=froots2(a); %valores de x e correspondente M
%residuos=fPnH1(n,a,x) %aferição
printf("\n Raizes da funcao roots do Octave:\n")
x=roots(a)