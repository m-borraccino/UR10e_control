% in questo file si creano tutte le matrici in simbolico per creare il regressore
% tau = B*dqq+C*dq+G 

syms q1 q2 q3 q4 q5 q6 ...
    dq1 dq2 dq3 dq4 dq5 dq6 ...
    ddq1 ddq2 ddq3 ddq4 ddq5 ddq6 ...
    m1 m2 m3 m4 m5 m6 ...
    g real
 
syms d1 al2 d2 al3 d3 d4 d5 d6...
    a1 b1 c1 a2 b2 c2 a3 b3 c3 a4 b4 c4 a5 b5 c5 a6 b6 c6...
    I1xx I1yy I1zz ...
    I2xx I2yy I2zz ...
    I3xx I3yy I3zz ...
    I4xx I4yy I4zz ...
    I5xx I5yy I5zz ...
    I6xx I6yy I6zz real


%% Matrice B

B = [(0.005625*m1 + 0.25250849999999997*m2*cos(q2)^2 + m2*(a2^2 + 2*a2*al2 + al2^2 + 2*d2^2 + (a2 + al2)^2*cos(2*q2)) + m3*(a3^2 + al2^2 + 2*a3*al3 + al3^2 + 2*d2^2 + 4*d2*d3 + 2*d3^2 + al2^2*cos(2*q2) + 2*al2*(a3 + al3)*cos(q3) + a3^2*cos(2*(q2 + q3)) + 2*a3*al3*cos(2*(q2 + q3)) + al3^2*cos(2*(q2 + q3)) + 2*a3*al2*cos(2*q2 + q3) + 2*al2*al3*cos(2*q2 + q3)) + 0.005625*m2*sin(q2)^2 + 0.22116402666666668*m3*(cos(q2)*cos(q3) - 1.*sin(q2)*sin(q3))^2 + 0.005625*m3*sin(q2 + q3)^2)/2, (a2*d2*m2 + al2*d3*m3 + al2*d2*(m2 + m3))*sin(q2) + (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3), (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3);
(a2*d2*m2 + al2*d3*m3 + al2*d2*(m2 + m3))*sin(q2) + (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3), (0.12625424999999998 + a2^2 + 2*a2*al2 + al2^2)*m2 + (0.11058201333333334 + a3^2 + al2^2 + 2*a3*al3 + al3^2)*m3 + 2*al2*(a3 + al3)*m3*cos(q3), m3*(0.11058201333333334 + a3^2 + 2*a3*al3 + al3^2 + al2*(a3 + al3)*cos(q3));
(a3 + al3)*(d2 + d3)*m3*sin(q2 + q3), m3*(0.11058201333333334 + a3^2 + 2*a3*al3 + al3^2 + al2*(a3 + al3)*cos(q3)), (0. + 0.*1) + ((0.11058201333333334 + 0.*1) + a3^2 + 2*a3*al3 + al3^2)*m3];

C = [((-2.*((0.12344174999999999 + a2^2 + 2.*a2*al2 + al2^2)*m2 + al2^2*m3)*sin(2*q2) - 2.*m3*((0.10776951333333334 + a3^2 + 2.*a3*al3 + al3^2)*sin(2*(q2 + q3)) + al2*(2.*a3 + 2.*al3)*sin(2*q2 + q3)))*dq2)/4 - 0.5*m3*(al2*(a3 + al3)*sin(q3) + (0.10776951333333334 + a3^2 + 2.*a3*al3 + al3^2)*sin(2*(q2 + q3)) + al2*(a3 + al3)*sin(2*q2 + q3))*dq3, ((-2.*((0.12344174999999999 + a2^2 + 2.*a2*al2 + al2^2)*m2 + al2^2*m3)*sin(2*q2) - 2.*m3*((0.10776951333333334 + a3^2 + 2.*a3*al3 + al3^2)*sin(2*(q2 + q3)) + al2*(2.*a3 + 2.*al3)*sin(2*q2 + q3)))*dq1)/4 + ((a2*d2*m2 + al2*d3*m3 + al2*d2*(m2 + m3))*cos(q2) + (a3 + al3)*(d2 + d3)*m3*cos(q2 + q3))*dq2 + (a3 + al3)*(d2 + d3)*m3*cos(q2 + q3)*dq3, m3*(-0.5*(al2*(a3 + al3)*sin(q3) + (0.10776951333333334 + a3^2 + 2.*a3*al3 + al3^2)*sin(2*(q2 + q3)) + al2*(a3 + al3)*sin(2*q2 + q3))*dq1 + (a3 + al3)*(d2 + d3)*cos(q2 + q3)*dq2 + (a3 + al3)*(d2 + d3)*cos(q2 + q3)*dq3);
((2.*((0.12344174999999999 + a2^2 + 2.*a2*al2 + al2^2)*m2 + al2^2*m3)*sin(2*q2) + m3*(2.*(0.10776951333333334 + a3^2 + 2.*a3*al3 + al3^2)*sin(2*(q2 + q3)) + 4*al2*(a3 + al3)*sin(2*q2 + q3)))*dq1)/4, -(al2*(a3 + al3)*m3*sin(q3)*dq3), -(al2*(a3 + al3)*m3*sin(q3)*(dq2 + dq3));
(m3*(2*al2*(a3 + al3)*sin(q3) + 2.*(0.10776951333333334 + a3^2 + 2.*a3*al3 + al3^2)*sin(2*(q2 + q3)) + 2*al2*(a3 + al3)*sin(2*q2 + q3))*dq1)/4, al2*(a3 + al3)*m3*sin(q3)*dq2, 0];

G = [0;
-(g*((a2*m2 + al2*(m2 + m3))*cos(q2) + (a3 + al3)*m3*cos(q2 + q3)));
-((a3 + al3)*g*m3*cos(q2 + q3))];

%%
q_vect = [q1 q2 q3]';
dq_vect = [dq1 dq2 dq3]';
ddq_vect = [ddq1 ddq2 ddq3]';

%%

Y_t = sym('Y', [3 3], 'real');
tau_ = sym('tau_', [3 1], 'real');
tau_r = sym('tau_r', [3 1], 'real');
tau = simplify(B*ddq_vect + C*dq_vect + G);

Pi = [m1 m2 m3]';
tau(1) = ddq1*((9*m1)/3200 + (7265812090074011*m2)/112589990684262400 + (1276708719984647*m3)/22517998136852480 + (6949152741274523*m2*cos(2*q2))/112589990684262400 + (6066884251123747*m3*cos(2*q2 + 2*q3))/112589990684262400 + (a2^2*m2)/2 + (a3^2*m3)/2 + (al2^2*m2)/2 + (al2^2*m3)/2 + (al3^2*m3)/2 + d2^2*m2 + d2^2*m3 + d3^2*m3 + a2*al2*m2 + a3*al3*m3 + 2*d2*d3*m3 + (a2^2*m2*cos(2*q2))/2 + (al2^2*m2*cos(2*q2))/2 + (al2^2*m3*cos(2*q2))/2 + (a3^2*m3*cos(2*q2 + 2*q3))/2 + (al3^2*m3*cos(2*q2 + 2*q3))/2 + a3*al2*m3*cos(q3) + al2*al3*m3*cos(q3) + a3*al2*m3*cos(2*q2 + q3) + al2*al3*m3*cos(2*q2 + q3) + a2*al2*m2*cos(2*q2) + a3*al3*m3*cos(2*q2 + 2*q3));
%%
[r,c] = size(tau);
for i = 1:r
    % primo link
    tau_(i) = simplify(subs(tau(i), {m2,m3}, {0,0}),'Steps',50);
    Y_t(i,1) = simplify(subs(tau_(i), m1, 1),'Steps',50);
    tau_r(i) = simplify(tau(i) - (Y_t(i,1) * Pi(1)),'Steps',50);

    % secondo link
    tau_(i) = simplify(subs(tau_r(i), {m3}, {0}),'Steps',50);
    Y_t(i,2) = simplify(subs(tau_(i), m2, 1),'Steps',50);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,2) * Pi(2)),'Steps',50);

    % terzo link
    Y_t(i,3) = simplify(subs(tau_r(i), m3, 1),'Steps',50);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,3) * Pi(3)),'Steps',50);

end

%% test sulla correttezza
tau_reg = simplify(Y_t * Pi);
res = simplify(tau - tau_reg)

%% Generazione della funzione per il calcolo della matrice Y
matlabFunction(Y_t,'File','Y_fun');



%%

l1  = 0.1273;
l21 = 0.220941;
l22 = 0.6120;
l31 = 0.1719;
l32 = 0.5723;

g = 9.81;
m11 = 7.778;
m22 = 12.93;
m33 = 3.87;
% param = (d1,al2,d2,al3,d3,a2,a3)
param = [l1,l22,l21,l32,-l31,-0.3060,-0.28615];


q = [0 pi/2 0.33]';
dq = [0.1 0.1 0.21]';
ddq = [0.01 0.05 0.01]';

tau = tau_fun(g,param,ddq,dq,q,m11,m22,m33)
Y_t = Y_fun(g,param,ddq,dq,q)*[m11;m22;m33]





%%
FK = [cos(q1)*cos(q2 + q3), -(cos(q1)*sin(q2 + q3)), -sin(q1), cos(q1)*(al2*cos(q2) + al3*cos(q2 + q3)) - (d2 + d3)*sin(q1);
cos(q2 + q3)*sin(q1), -(sin(q1)*sin(q2 + q3)), cos(q1), (d2 + d3)*cos(q1) + (al2*cos(q2) + al3*cos(q2 + q3))*sin(q1);
-sin(q2 + q3), -cos(q2 + q3), 0, d1 - al2*sin(q2) - al3*sin(q2 + q3);
0, 0, 0, 1];

matlabFunction(FK,'File','FK_3r');

J=[-((d2 + d3)*cos(q1)) - (al2*cos(q2) + al3*cos(q2 + q3))*sin(q1), -(cos(q1)*(al2*sin(q2) + al3*sin(q2 + q3))), -(al3*cos(q1)*sin(q2 + q3));
    cos(q1)*(al2*cos(q2) + al3*cos(q2 + q3)) - (d2 + d3)*sin(q1), -(sin(q1)*(al2*sin(q2) + al3*sin(q2 + q3))), -(al3*sin(q1)*sin(q2 + q3));
    0, -(al2*cos(q2)) - al3*cos(q2 + q3), -(al3*cos(q2 + q3));
    0, -sin(q1), -sin(q1);
    0, cos(q1), cos(q1);
    1, 0, 0];

matlabFunction(J,'File','J_3r');


param = [l1,l22,l21,l32,-l31,-0.3060,-0.28615];
q = [0 -pi/2 0]';
J=J_3r(param,q)