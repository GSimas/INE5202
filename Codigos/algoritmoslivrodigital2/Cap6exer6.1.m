format long
clc
clear
%f(x)=sen(x);                        com x entre [a=-pi/2;b=+pi/2]
n = 1;
a = -1
b = +1
np = 100; %N. de pontos para plotar os resultados aproximados
hp = (b-a)/np;
xp = a:hp:b;
ye = sin(xp); %valores exatos para plotagem

erromaxPn=1;
while (erromaxPn>sqrt(10)*1e-2) %O(1e-2)
	n=n+1;
	h = (b - a)/n; % passo
	x = a:h:b;
%	t=0.5.*(b.-a).+0.5.*(b.+a);
	y = sin(x);
	% Interpolação polinomial de Gregory Newton
	difdiv1=fdifdiv(n,x,y); %vetor com diferenças no ponto i = 1	ye = sin(xp); %valores exatos
	yip=fgregoryn(n,x,y,difdiv1,xp); %y aproximado para cada xp(i)
	erroPn=abs(yip.-ye);
	erromaxPn=max(erroPn);
end
'Interpolacao polinomial:'
n
erromaxPn

%Serie de Maclaurin
%coeficientes de Maclaurin ordem crescente de grau
for i=1:5
	ii=2*i;
	c(ii-1)=0;
	c(ii)=(-1)^(i-1)/factorial(2*i-1);
end
c
n=0;
erromaxMn=1;
while (erromaxMn>sqrt(10)*1e-2) %O(1e-2)
	n=n+1
%	t=0.5.*(b.-a).+0.5.*(b.+a);
	% Aprox. serie Maclaurin
	yiM =fPnH(n, c, xp);
	erroMn=abs(yiM.-ye);
	erromaxMn=max(erroMn)
end
'Maclaurin'
n
erromaxMn
'coeficientes da serie de MacLaurim:'
c(1:n+1)

'Tchebyschev'
n=5;
%M5(x)=0.0*x0+1.0*x1+0.0*x2-0.166666666666667*x3+0.0*x4+0.008333333333333*x5
%Erro de truncamento maximo de M5(x)=|sen(x)|*(1-0)(5+1)/(5+1)!=1/720=1.388888e-3=O(10-3) (resto máximo da série) 
%Erro de truncamento maximo de M5(x)= 1/7! =1.98412698413e-04=O(10-4) (1º termo abandonado em séries com sinais alternadas - não vale para termos com variação dupla)
%C5(T)= 0. + 169/192*T1 - (5*T3)/128 + T5/1920 (truncando o último termo da série de Tchebychev)
%Erro de truncamento maximo total = 1/6!+1/1920 = 1.909722222e-3=O(10-3)  (ordem de M5(x))
%C3(T)= 0. + 169/192*T1 - (5*T3)/128
%C3(x)= 0.*1 + 169/192*x - (5*(4*x3-3*x))/128
%C3(x)= (383*x)/384-(5*x3)/32
n=3
C=[0 383/384 0 -5/32 ]
yiT = fPnH(n, C, xp);
erroTn1=abs(yiT.-ye);
erromaxTn=max(erroTn1)

'Tchebyschev'
n=7;
%M7(x)=0.0*x0+1.0*x1+0.0*x2-0.166666666666667*x3+0.0*x4+0.008333333333333*x5+0.0*x6-1.98412698412698e-04*x7
%M7(x)=0.0*x0+1.0*x1+0.0*x2-1/6              *x3+0.0*x4+1/120            *x5+0.0*x6-1/5040              *x7
%Erro de truncamento maximo de M7(x)= |sen(x)|*(1-0)(7+1)/(7+1)!=1/8!=1/40320= 2.4801587301e-05=O(10-5)
%Erro de truncamento maximo de M7(x)= 1/9! =2.75573192239859e-06=O(10-6) (1º termo abandonado em séries com sinais alternadas - nao vale para seres com grau variando de 2 em 2)
%C7(x)= 1.0*T1-1/6*(T3+3*T1)/4+1/120*(T5+5*T3+10*T1)/16-1/5040*(T7+7*T5+21*T3+35*T1)/64
%C7(T)= 0. + 169/192*T1 -(601*T3)/15360+(23*T5)/46080-T7/322560
%Erro de truncamento maximo total = 1/8!+1/322560 = 2.790178571e-05 =O(10-5) (ordem de M7(x))
%C5(T)= 0. + 169/192*T1 -(601*T3)/15360+(23*T5)/46080
%C5(T)= 0. + 169/192*x -(601*(4*x3-3*x))/15360+(23*(16*x^5-20*x3+5*x))/46080
%C5(T)=0. + (11521 x)/11520 - (959 x^3)/5760 + (23 x^5)/2880
n=5
C=[0. +(11521)/11520 0 -(959)/5760  0.  +(23)/2880 ]
yiT2 = fPnH(n, C, xp);
erroTn2=abs(yiT2.-ye);
erromaxTn2=max(erroTn2)

%R32 = (a(1) + a(2)x + a(3)x^2 + a(4)x^3)/(1 + b(1)x + b(2)*x^2)
npade=3
mpade=2
[a b]=fPade(npade,mpade,c) 

yPade=fPnH(npade,a,xp)./fPnH(mpade,b,xp);

erroR32=abs(yPade.-ye);
erromaxR32=max(erroR32)

plot(xp,erroTn1,"--r;Erro=|T3(x)-sin(x)|, Serie Tchebychev n=3;",xp,erroTn2,"-k;Erro=|T5(x)-sin(x)|, Serie Tchebychev n=5;",xp,erroR32,".b; Erro=|R32(x)-sin(x)|, R32(x)= Racional Pade M=5;")
legend('location','north')
grid on