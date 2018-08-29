clc
clear
% Algoritmo para matriz tridiagonal):
n=5
	t=[NaN   1   1  -1  -1  ]; %faixa à esquerda da principal
	r=[  1   1  -1   1   2  ]; %diagonal principal
	d=[ -1  -1   1   1  NaN ]; %faixa à direita da principal
	b=[  0   1   2  -1  -2  ]; %termos independentes
x=ftrid(n,r,t,d,b)