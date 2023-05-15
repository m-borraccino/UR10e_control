function tau = tau_fun_SL(g,param,ddqr,dqr,dq,q,m1,m2,m3)
%tau_fun_SL
%    TAU = tau_fun_SL(A2,A3,AL2,AL3,D2,D3,DDQR1,DDQR2,DDQR3,DQ1,DQ2,DQ3,DQR1,DQR2,DQR3,G,M1,M2,M3,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    12-Jun-2022 16:31:06

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

dqr1 = dqr(1);
dqr2 = dqr(2);
dqr3 = dqr(3);

ddqr1 = ddqr(1);
ddqr2 = ddqr(2);
ddqr3 = ddqr(3);

t2 = cos(q2);
t3 = cos(q3);
t4 = sin(q2);
t5 = sin(q3);
t6 = a3+al3;
t7 = d2+d3;
t8 = m2+m3;
t9 = q2+q3;
t10 = a3.*2.0;
t11 = a2.^2;
t12 = a3.^2;
t13 = al3.*2.0;
t14 = al2.^2;
t15 = al3.^2;
t16 = d2.^2;
t17 = q2.*2.0;
t18 = q3.*2.0;
t19 = a2.*al2.*2.0;
t21 = a3.*al3.*4.0;
t24 = a2.*d2.*m2;
t25 = al2.*d2.*m2;
t26 = al2.*d2.*m3;
t27 = al2.*d3.*m3;
t32 = a2.*al2.*m2.*4.0;
t47 = m2.*2.468835e-1;
t20 = al3.*t10;
t22 = cos(t17);
t23 = sin(t17);
t28 = cos(t9);
t29 = sin(t9);
t30 = a3.*t10;
t31 = al3.*t13;
t33 = q2+t9;
t36 = m2.*t11.*2.0;
t37 = m2.*t14.*2.0;
t38 = m3.*t14.*2.0;
t39 = t9.*2.0;
t40 = al2.*t3.*t6;
t41 = t6.*2.0;
t46 = t24+t25+t26+t27;
t34 = cos(t33);
t35 = sin(t33);
t42 = cos(t39);
t43 = sin(t39);
t44 = m3.*t6.*t7.*t29;
t48 = t12+t15+t20+1.077695133333333e-1;
t49 = t21+t30+t31+2.155390266666667e-1;
t50 = t12+t15+t20+t40+1.105820133333333e-1;
t53 = t32+t36+t37+t38+t47;
t45 = al2.*t35.*t41;
t51 = t43.*t48;
t52 = t43.*t49;
t54 = t23.*t53;
t55 = t45+t51;
t56 = m3.*t55.*2.0;
t57 = t54+t56;
et1 = m1.*2.8125e-3+m2.*6.453337499999999e-2+m3.*5.669725666666667e-2+(m2.*t11)./2.0+(m3.*t12)./2.0+(m2.*t14)./2.0+(m3.*t14)./2.0+m2.*t16+(m3.*t15)./2.0+m3.*t16+m2.*t22.*6.172087499999999e-2;
et2 = m3.*t42.*5.388475666666667e-2+d3.^2.*m3+a2.*al2.*m2+a3.*al3.*m3+d2.*d3.*m3.*2.0+(m2.*t11.*t22)./2.0+(m2.*t14.*t22)./2.0+(m3.*t14.*t22)./2.0+(m3.*t12.*t42)./2.0+(m3.*t15.*t42)./2.0+a3.*al2.*m3.*t3+a2.*al2.*m2.*t22+a3.*al2.*m3.*t34+a3.*al3.*m3.*t42+al2.*al3.*m3.*t3+al2.*al3.*m3.*t34;
et3 = ddqr1.*(t44+t4.*(t24+t27+al2.*d2.*t8))-g.*(t2.*(a2.*m2+al2.*t8)+m3.*t6.*t28)+ddqr2.*(m3.*t40.*2.0+m3.*(t12+t14+t15+t20+1.105820133333333e-1)+m2.*(t11+t14+t19+1.2625425e-1))+(dq1.*dqr1.*(m3.*(t52+al2.*t6.*t35.*4.0)+t23.*(t38+m2.*(t11+t14+t19+1.2344175e-1).*2.0)))./4.0+ddqr3.*m3.*t50-al2.*dqr3.*m3.*t5.*t6.*(dq2+dq3);
et4 = -al2.*dq3.*dqr2.*m3.*t5.*t6;
mt1 = [ddqr3.*t44+ddqr1.*(et1+et2)+dqr2.*(dq1.*t57.*(-1.0./4.0)+dq2.*(t2.*t46+m3.*t6.*t7.*t28)+dq3.*m3.*t6.*t7.*t28)-dqr1.*((dq2.*t57)./4.0+(dq3.*m3.*(t51+al2.*t5.*t6+al2.*t6.*t35))./2.0)+ddqr2.*(t44+t4.*t46)+dqr3.*m3.*(-dq1.*(t43.*(t12./2.0+t15./2.0+a3.*al3+5.388475666666667e-2)+(al2.*t5.*t6)./2.0+(al2.*t6.*t35)./2.0)+dq2.*t6.*t7.*t28+dq3.*t6.*t7.*t28);et3+et4];
mt2 = [ddqr1.*t44+ddqr3.*m3.*(t12+t15+t20+1.105820133333333e-1)+ddqr2.*m3.*t50-g.*m3.*t6.*t28+(dq1.*dqr1.*m3.*(t45+t52+al2.*t5.*t41))./4.0+al2.*dq2.*dqr2.*m3.*t5.*t6];
tau = [mt1;mt2];
