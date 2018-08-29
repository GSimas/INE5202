function fgrafico3D_exem7_3(m,v,T,P,R,a,b)
% Calculando passos:
  hv=(max(v)-min(v))/40;
  hT=(max(T)-min(T))/40;
      % Definindo pontos:
  vp=min(v):hv:max(v);
  Tp=min(T):hT:max(T);
  for i=1:41
    for j=1:41
      Pp(i,j)=funcaoP(a,b,R,vp(i),Tp(j));
    end
  end
      % Plotando:
  surf(vp,Tp,Pp)
  xlabel('v(m3/mol)')
  ylabel('T(K)')
  zlabel('P(Pa)')
  grid on
  axis square
  hold on
  plot3(v,T,P,'*k','markersize',10,'linewidth',3)
  hold off
end