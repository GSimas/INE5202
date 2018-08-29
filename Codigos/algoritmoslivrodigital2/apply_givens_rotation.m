%---------------------------------------------------------------------%
%                  Applying Givens Rotation to H col                  %
%---------------------------------------------------------------------%
function [h, cs_k sn_k] = apply_givens_rotation(h, cs, sn, k)
  %apply for ith column
  for i = 1:k-1

    temp     =  cs(i)*h(i) + sn(i)*h(i+1);
    h(i+1) = -sn(i)*h(i) + cs(i)*h(i+1);
    h(i)   = temp;
  end
  %update the next sin cos values for rotation
  [cs_k sn_k] = givens_rotation( h(k), h(k+1));
  %eliminate H(i+1,i)
  h(k) = cs_k*h(k) + sn_k*h(k+1);
  h(k+1) = 0.0;
end