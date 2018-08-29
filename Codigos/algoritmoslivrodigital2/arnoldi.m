%----------------------------------------------------%
%                  Arnoldi Function                  %
%----------------------------------------------------%
function [h q] = arnoldi(A, Q, k)
%  'inicio arnoldi';
%  A
%  Q(:,k)
  q = A*Q(:,k);
  for i = 1:k,
    h(i)= q'*Q(:,i);
    q = q - h(i)*Q(:,i);
  end
%  '2'
%  h
%  q
  h(k+1) = norm(q);
  q = q / h(k+1);
%  '3'
%  h
%  q
end