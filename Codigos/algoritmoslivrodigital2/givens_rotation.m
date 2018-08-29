%%----Calculate the Given rotation matrix----%%
function [cs sn] = givens_rotation(v1, v2)
  if (v1==0)
    cs = 0;
    sn = 1;
  else
    t=sqrt(v1^2+v2^2);
    cs = abs(v1) / t;
    sn = cs * v2 / v1;
  end
end