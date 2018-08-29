function [x, e] = gmres( A, b, x, max_iterations, threshold)
  n = length(A);
  m = max_iterations;
  
  %use x as the initial vector
  r=b-A*x;

  b_norm = norm(b);
  r_norm = norm(r);
  error  = r_norm/b_norm

  %initialize the 1D vectors
  sn = zeros(m,1);
  cs = zeros(m,1);
  e1 = zeros(n,1);
  e1(1) = 1;
  e=[error];
  r_norm=norm(r);
  Q(:,1) = r/r_norm;
  beta = r_norm*e1;
  k=0;
  while ( error > threshold && k <= m )                               
    k=k+1;
    %run arnoldi
    [H(1:k+1,k) Q(:,k+1)] = arnoldi(A, Q, k);
    
    %eliminate the last element in H ith row and update the rotation matrix
    [H(1:k+1,k) cs(k) sn(k)]=apply_givens_rotation(H(1:k+1,k), cs, sn, k);
    
    %update the residual vector
    beta(k+1) = -sn(k)*beta(k);
    beta(k)   =  cs(k)*beta(k);
    error  = abs(beta(k+1)) / b_norm;

    %save the error
    e=[e; error];

  end
k
  %calculate the result
  
%  y1=inverse(H(1:k,1:k))*beta(1:k)

  y = H(1:k,1:k) \ beta(1:k);
  x = x + Q(:,1:k)*y;
end
