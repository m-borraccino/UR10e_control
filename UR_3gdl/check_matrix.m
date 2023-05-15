l1  = 0.1273;
l21 = 0.220941;
l22 = 0.6120;
l31 = 0.1719;
l32 = 0.5723;

g = 9.81;

m1 = 7.778;
m2 = 12.93;
m3 = 3.87;

% param = (d1,al2,d2,al3,d3,a2,a3)
param = [l1,l22,l21,l32,-l31,-0.3060,-0.28615];


%[I1,cg1,I2,cg2,I3,cg3,I4,cg4,I5,cg5,I6,cg6] = tensor_rotation(ur10e)

dhparams = [0   	-pi/2	l1   	0;
            l22	    0       l21     0;
            l32  	0	    -l31	0];

robot1 = rigidBodyTree;
robot1.DataFormat = 'column';
bodies = cell(3,1);
joints = cell(3,1);
for i = 1:3
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");

    setFixedTransform(joints{i},dhparams(i,:),"dh");
    bodies{i}.Joint = joints{i};
    if i == 1 % Add first body to base
        addBody(robot1,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(robot1,bodies{i},bodies{i-1}.Name)
    end
end

robot1.Gravity = [0,0,-g];

figure
q = homeConfiguration(robot1)
show(robot1, q) 


ur10e = loadrobot("universalUR10");
removeBody(ur10e,'tool0');
removeBody(ur10e,'ee_link');
removeBody(ur10e,'wrist_3_link');
removeBody(ur10e,'wrist_2_link');
removeBody(ur10e,'wrist_1_link');


ur10e.DataFormat = 'column';
ur10e.Gravity = [0,0,-g];

q=randomConfiguration(robot1);


%%

figure
show(robot1, q) 
hold on
show(ur10e, q,'Visuals','on')


%% Forward kinematics check
q=randomConfiguration(robot1);
% T00 = getTransform(robot1, q,'body6')
% T00 = getTransform(ur10e, q,'ee_link')
% T00-T0

T0 = UR_FK(q)

%% Jacobian check

J1 = geometricJacobian(robot1 ,q,'body6')
J2 = geometricJacobian(ur10e ,q,'ee_link')

J1-J2

J = UR_JJ(q);
J = [J(4:6,:);J(1:3,:)]

J-J1
J-J2

%% Inertia Matrix check
% syms q1 q2 q3 q4 q5 q6 ...
%     dq1 dq2 dq3 dq4 dq5 dq6 ...
%     ddq1 ddq2 ddq3 ddq4 ddq5 ddq6 ...
%     m1 m2 m3 m4 m5 m6 ...
%     g real
%  
% syms d1 al2 d2 al3 d3 d4 d5 d6...
%     a1 b1 c1 a2 b2 c2 a3 b3 c3 a4 b4 c4 a5 b5 c5 a6 b6 c6...
%     I1xx I1yy I1zz ...
%     I2xx I2yy I2zz ...
%     I3xx I3yy I3zz ...
%     I4xx I4yy I4zz ...
%     I5xx I5yy I5zz ...
%     I6xx I6yy I6zz real

% B = [(0.005625*m1 + 0.25250849999999997*m2*cos(q2)^2 + m2*(a2^2 + 2*a2*al2 + al2^2 + 2*d2^2 + (a2 + al2)^2*cos(2*q2)) + m3*(a3^2 + al2^2 + 2*a3*al3 + al3^2 + 2*d2^2 + 4*d2*d3 + 2*d3^2 + al2^2*cos(2*q2) + 2*al2*(a3 + al3)*cos(q3) + a3^2*cos(2*(q2 + q3)) + 2*a3*al3*cos(2*(q2 + q3)) + al3^2*cos(2*(q2 + q3)) + 2*a3*al2*cos(2*q2 + q3) + 2*al2*al3*cos(2*q2 + q3)) + 0.005625*m2*sin(q2)^2 + 0.22116402666666668*m3*(cos(q2)*cos(q3) - 1.*sin(q2)*sin(q3))^2 + 0.005625*m3*sin(q2 + q3)^2)/2, (a2*d2*m2 + al2*d3*m3 + al2*d2*(m2 + m3))*sin(q2) + (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3), (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3);
% (a2*d2*m2 + al2*d3*m3 + al2*d2*(m2 + m3))*sin(q2) + (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3), (0.12625424999999998 + a2^2 + 2*a2*al2 + al2^2)*m2 + (0.11058201333333334 + a3^2 + al2^2 + 2*a3*al3 + al3^2)*m3 + 2*al2*(a3 + al3)*m3*cos(q3), m3*(0.11058201333333334 + a3^2 + 2*a3*al3 + al3^2 + al2*(a3 + al3)*cos(q3));
% (a3 + al3)*(d2 + d3)*m3*sin(q2 + q3), m3*(0.11058201333333334 + a3^2 + 2*a3*al3 + al3^2 + al2*(a3 + al3)*cos(q3)), (0. + 0.*1) + ((0.11058201333333334 + 0.*1) + a3^2 + 2*a3*al3 + al3^2)*m3];
% 
% matlabFunction(B,'File','B_3r');
%%
q=randomConfiguration(robot1)
B = B_3r(param,m1,m2,m3,q)
B = B_3r2(param,m1,m2,m3,q)
BB = massMatrix(ur10e,q)

% B-BB
%% Coriolis Matrix check
dq = [0.1 0.1 0.1]';

C = C_3r(param,m1,m2,m3,q,dq);
Cdq = C*dq
CCdq = velocityProduct(ur10e,q,dq)

%% Gravity torque Check

q=randomConfiguration(robot1);

G  = G_3r(g,param,m1,m2,m3,q) 
GG = gravityTorque(ur10e,q)


