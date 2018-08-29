function raio=fmodmax(n,a)
%Calcula o máximo modulo de todas as raízes
	raio=1+max(abs(a(2:n+1)))/abs(a(1));
end #function