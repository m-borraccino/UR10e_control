function [T0,phi,theta,psi] = UR_FK(q)


q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);

T0 =    [1.*cos(q6)*sin(q1)*sin(q5) + cos(q1)*(cos(q2 + q3 + q4)*cos(q5)*cos(q6) - 1.*sin(q2 + q3 + q4)*sin(q6)), -1.*sin(q1)*sin(q5)*sin(q6) + cos(q1)*(-1.*cos(q6)*sin(q2 + q3 + q4) - 1.*cos(q2 + q3 + q4)*cos(q5)*sin(q6)), -1.*cos(q5)*sin(q1) + 1.*cos(q1)*cos(q2 + q3 + q4)*sin(q5), (-0.16390000000000002 - 0.0922*cos(q5))*sin(q1) + cos(q1)*(0.612*cos(q2) + 0.5732*cos(q2 + q3) - 0.1157*sin(q2 + q3 + q4) - 0.0461*sin(q2 + q3 + q4 - q5) + 0.0461*sin(q2 + q3 + q4 + q5));
        cos(q2 + q3 + q4)*cos(q5)*cos(q6)*sin(q1) - 1.*cos(q1)*cos(q6)*sin(q5) - 1.*sin(q1)*sin(q2 + q3 + q4)*sin(q6), -1.*cos(q6)*sin(q1)*sin(q2 + q3 + q4) + (-1.*cos(q2 + q3 + q4)*cos(q5)*sin(q1) + 1.*cos(q1)*sin(q5))*sin(q6), 1.*cos(q1)*cos(q5) + 1.*cos(q2 + q3 + q4)*sin(q1)*sin(q5), cos(q1)*(0.16390000000000002 + 0.0922*cos(q5)) + sin(q1)*(0.612*cos(q2) + 0.5732*cos(q2 + q3) - 0.1157*sin(q2 + q3 + q4) - 0.0461*sin(q2 + q3 + q4 - q5) + 0.0461*sin(q2 + q3 + q4 + q5));
        -1.*cos(q5)*cos(q6)*sin(q2 + q3 + q4) + 0.5*sin(q2 + q3 + q4 - q6) - 0.5*sin(q2 + q3 + q4 + q6), -0.5*cos(q2 + q3 + q4 - q6) - 0.5*cos(q2 + q3 + q4 + q6) + 1.*cos(q5)*sin(q2 + q3 + q4)*sin(q6), -0.5*cos(q2 + q3 + q4 - q5) + 0.5*cos(q2 + q3 + q4 + q5), 0.1273 - 0.1157*cos(q2 + q3 + q4) - 0.0461*cos(q2 + q3 + q4 - q5) + 0.0461*cos(q2 + q3 + q4 + q5) - 0.6119999999999999*sin(q2) - 0.5732000000000002*sin(q2 + q3);
        0., 0., 0., 1.];

% Parametrizzazione XYZ
%Rzyz = R_z(phi)*R_y(theta)*R_z(psi) 

R = T0(1:3,1:3);
eulXYZ = rotm2eul(R, 'XYZ');
phi   = eulXYZ(1);
theta = eulXYZ(2);
psi   = eulXYZ(3);
 
end
