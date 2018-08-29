clear
clc
format long 
n=3
for i=1:n Xi(i)=0.5; end

printf("\n Solucao por Newton:\n")
X=fNewton3(Xi)
residuomaximo=max(G(X))

printf("\n Solucao por Newton com derivadas numericas:\n")
X=fNewtonNnum(n,Xi)
residuomaximo=max(G(X))

printf("\n Solucao por Broyden:\n")
X=fBroyden3(Xi)
residuomaximo=max(G(X))

printf("\n Solucao por Broyden  com derivadas numericas:\n")
X=fBroydenNnum(n,Xi)
residuomaximo=max(G(X))