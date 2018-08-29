function rmax=fresiduosLU(n,Ao,bo,x)
	for i=1:n
		soma=0;
		for j=1:n
			soma=soma+Ao(i,j)*x(j);
		end %for j
		r(i)=abs(soma-bo(i));
	end %for i
  rmax=max(r);
end %function