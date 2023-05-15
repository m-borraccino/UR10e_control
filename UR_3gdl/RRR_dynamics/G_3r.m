function G = G_3r(g,param,m1,m2,m3,q)
%G_3r
%    G = G_3r(A2,A3,AL2,AL3,g,M2,M3,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    12-Jun-2022 02:54:55

d1  = param(1);
al2 = param(2);
d2  = param(3);
al3 = param(4);
d3  = param(5);
a2  = param(6);
a3  = param(7);

q1 = q(1);
q2 = q(2);
q3 = q(3);

t2 = a3+al3;
t3 = q2+q3;
t4 = cos(t3);
G = [0.0;-g.*(cos(q2).*(a2.*m2+al2.*(m2+m3))+m3.*t2.*t4);-g.*m3.*t2.*t4];
