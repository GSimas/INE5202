function y = frestoPn(n, a, x)
Nx = length(x); %numero de elementos no vetor x
for k=1:Nx
% divisao sintetica via Briot-Ruffini
	b(1) = a(1);
	for i=2:n+1
		b(i) = a(i) + x(k)*b(i-1);
	end %for
	y(k) = b(n+1);
end %for
end %function