function fgrafico2D_exem7_3(m,v,T,P,R,a,b)
% Definindo pontos:
  for i=1:m
      Pp(i)=funcaoP(a,b,R,v(i),T(i));
  end
% Plotando 2D em fun��o do �ndice dos pontos 1:m
  plot((1:m),P,'*k','markersize',10,(1:m),Pp,'-k','linewidth',3)

  xlabel('Indice k dos pontos')
  ylabel('P(Pa)') 
  


end