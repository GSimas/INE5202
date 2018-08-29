function M=fmultiplicidade(n,a,R,Rlim)
M=1;
somarestos=abs(R(1))+abs(R(2));
while somarestos<Rlim
    M=M+1;
    somarestos=somarestos+abs(R(M+1));
end
end