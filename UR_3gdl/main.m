clear all; close all; clc;
addpath('./Sim');   addpath('./RRR_dynamics');   addpath('./Utils');

[ur10e_bis,ur10e] = load_robot_RRR();

g = 9.81;   % gravity constant

% Initial conditions
q0 =   [-0.3964,-0.4178,-1.3883]';
dq0 =  [0, 0, 0]';
ddq0 = [0, 0, 0]';

%% Parameters of the three links

param = [0.1273,0.6120,0.2209,0.5723,-0.1719,-0.3060,-0.2862];

m1 = 7.778;
m2 = 12.93;
m3 = 3.87;

rel_err = 0.0;
%% Trajectory
% Velocità della traiettoria
slow = 15;

% Punto iniziale e-e
%p0 = [0.6; 0; 0.5];
p0 = [0.6; 0; 0.5];

%Parametri per generare la traiettoria
r0 = 0.3;   %su x   per una cirfonferenza porre r0=0
r1 = 0.4;   %su y 
r2 = 0.4;   %su z


%% Guadagni PD e Computed Torque

%[1 -> PD]  [2 -> Computed Torque]
controller = 2; 

Kp_PD = eye(3);
Kv_PD = eye(3);

Kp_CT = eye(3);
Kv_CT = eye(3);

%% Backstepping
Lambda_BS = diag([10,10,10])*5;
Ks_BS = diag([1,1,1]);

%% Guadagni ComputedTorque Adattivo 
Pi = [m1;m2;m3];
Pi_hat0_ADct = Pi + diag([0 0.1 -0.1])*Pi;

Kp_CTad = diag([50 200 100]);
Kv_CTad = diag([10 10 10]);

R_ADct = diag([1 1 1]);
B_ADct = [zeros(3); diag([1 1 1]) ];
A_ADct = [zeros(3)   eye(3);
          -Kp_CTad -Kv_CTad];
Q_ADct = diag([1 1 1 1 1 1]);
P_ADct = lyap(A_ADct,Q_ADct);

%% For adaptive backstepping
Pi = [m1;m2;m3];
Pi_hat0_ADbs = Pi + diag([0. 0.1 -0.1])*Pi;

Lambda_ADbs = diag([1 1 1]);
R_ADbs = diag([1 1 1]);
% R_ADbs = diag([0.1 0.1 0.1]);   %better
Ks_ADbs = diag([15 15 15]);


fprintf('Ready for Simulation...\n')