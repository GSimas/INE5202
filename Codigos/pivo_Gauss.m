%Universidade Federal de Santa Catarina - UFSC
%Cálculo Numérico - INE5202
%Pivoteamento Parcial de Gauss
%Gustavo Simas da Silva

function g = pivo_Gauss(A,b)

M = horzcat(A,b'); %geracao matriz expandida
n=size(A,1); %tamanho matriz A
ord=[1:n] %vetor de ordenamento
x = [1:n] %vetor solucao

for k=1:n-1
  maior=abs(M(k,k));
  pivo=k;
  for i=1:n
    if (abs(M(i,k))>maior)
      maior=abs(M(i,k));
      pivo=i;
    end
  end
  M
  maior
  pivo
  if pivo>k
    aux = ord(k);
    ord(k) = ord(pivo);
    ord(pivo) = aux;
    for j=k:n+1
      aux=M(k,j);
      M(k,j)=M(pivo,j);
      M(pivo,j)=aux;
    end
  end
  for i=k+1:n
    m=M(i,k)/M(k,k);
    for j=k:n+1
      M(i,j)=M(i,j)-m*M(k,j);
    end
  end
  ord
  pause
end
M
x(n)=M(n,n+1)/M(n,n);
for i=n-1:-1:1
  soma=0;
  for j=i+1:n
    soma=soma+M(i,j)*x(j);
  end
  x(i)=(M(i,n+1)-soma)/M(i,i);
end

b1 = M(:,n+1);
A1 = M(:,1:n);

A
b
ord
x
r=abs(b1 - A1*x')


