function J = J_3r(param,q)
%J_3r
%    J = J_3r(AL2,AL3,D2,D3,Q1,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    12-Jun-2022 22:56:44

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

t2 = cos(q1);
t3 = cos(q2);
t4 = sin(q1);
t5 = sin(q2);
t6 = d2+d3;
t7 = q2+q3;
t8 = al2.*t3;
t9 = cos(t7);
t10 = al2.*t5;
t11 = sin(t7);
t12 = -t4;
t13 = al3.*t9;
t14 = al3.*t11;
t15 = -t13;
t16 = t8+t13;
t17 = t10+t14;
J = reshape([-t2.*t6+t12.*t16,t2.*t16+t6.*t12,0.0,0.0,0.0,1.0,-t2.*t17,t12.*t17,-t8+t15,t12,t2,0.0,-t2.*t14,t12.*t14,t15,t12,t2,0.0],[6,3]);
