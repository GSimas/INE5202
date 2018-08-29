function y=funcaoP(a,b,R,vp,Tp);
	y=R.*Tp./(vp.-b).-a./(sqrt(Tp).*vp.*(vp.+b));
end