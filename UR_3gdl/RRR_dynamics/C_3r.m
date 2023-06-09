function C = C_3r(param,m1,m2,m3,q,dq)
%C_3r
%    C = C_3r(A2,A3,AL2,AL3,D2,D3,DQ1,DQ2,DQ3,M2,M3,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    12-Jun-2022 02:57:26

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

dq1 = dq(1);
dq2 = dq(2);
dq3 = dq(3);

t2 = sin(q3);
t3 = a3+al3;
t4 = d2+d3;
t5 = q2+q3;
t6 = a3.*2.0;
t7 = a2.^2;
t8 = a3.^2;
t9 = al3.*2.0;
t10 = al2.^2;
t11 = al3.^2;
t12 = q2.*2.0;
t13 = q3.*2.0;
t14 = a2.*al2.*2.0;
t16 = a3.*al3.*4.0;
t15 = al3.*t6;
t17 = sin(t12);
t18 = cos(t5);
t19 = a3.*t6;
t20 = al3.*t9;
t21 = q2+t5;
t23 = m3.*t10.*2.0;
t24 = t5.*2.0;
t25 = t3.*2.0;
t29 = t7+t10+t14+1.2344175e-1;
t22 = sin(t21);
t26 = sin(t24);
t28 = t8+t11+t15+1.077695133333333e-1;
t30 = m2.*t29.*2.0;
t31 = t16+t19+t20+2.155390266666667e-1;
t27 = al2.*t22.*t25;
t32 = t26.*t28;
t33 = t23+t30;
t34 = t26.*t31;
t35 = t17.*t33;
t36 = t27+t32;
t37 = m3.*t36.*2.0;
t38 = t35+t37;
C = reshape([dq2.*t38.*(-1.0./4.0)-(dq3.*m3.*(t32+al2.*t2.*t3+al2.*t3.*t22))./2.0,(dq1.*(t35+m3.*(t34+al2.*t3.*t22.*4.0)))./4.0,(dq1.*m3.*(t27+t34+al2.*t2.*t25))./4.0,dq1.*t38.*(-1.0./4.0)+dq2.*(cos(q2).*(al2.*d2.*(m2+m3)+a2.*d2.*m2+al2.*d3.*m3)+m3.*t3.*t4.*t18)+dq3.*m3.*t3.*t4.*t18,-al2.*dq3.*m3.*t2.*t3,al2.*dq2.*m3.*t2.*t3,m3.*(-dq1.*(t32./2.0+(al2.*t2.*t3)./2.0+(al2.*t3.*t22)./2.0)+dq2.*t3.*t4.*t18+dq3.*t3.*t4.*t18),-al2.*m3.*t2.*t3.*(dq2+dq3),0.0],[3,3]);
