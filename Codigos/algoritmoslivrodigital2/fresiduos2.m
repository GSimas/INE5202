function r=fresiduos2(n,ao,bo,x)
for i=1:n
	soma=0;
	for j=1:n
	    soma=soma+ao(i,j)*x(j);
	end
	r(i)=abs(soma-bo(i));
end
end
