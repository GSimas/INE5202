function R=fresiduos(n,Ao,x)
  A=Ao(1:n,1:n);b=Ao(1:n,n+1);
 R=max(abs(A*x-b));
end