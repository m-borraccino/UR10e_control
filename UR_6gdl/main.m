clear all; close all; clc;
addpath('./Sim');   addpath('./UR_dynamics');   addpath('./Utils');

[ur10e_bis,ur10e] = load_robot();

g = 9.81;   % gravity constant

% Initial conditions
q0 =   [-0.3964,-0.4178,-1.3883,0.9782,0.7463,-1.8518]';
%q0 =   [-0.3287,-0.1611,-1.6271,-1.3534,-1.2421,-0.0000];
dq0 =  [0, 0, 0, 0, 0, 0]';
ddq0 = [0, 0, 0, 0, 0, 0]';

% Relative error (uncertainty)
rel_err = 0.0;

%% Trajectory
% Velocità della traiettoria
slow = 15;

% Punto iniziale e-e
%p0 = [0.6; 0; 0.5; pi/4;0;pi/4];
p0 = [0.6; 0; 0.5; 0;0;0];
%Parametri per generare la traiettoria
r0 = 0.3;   %su x   per una cirfonferenza porre r0=0
r1 = 0.4;   %su y 
r2 = 0.4;   %su z

%% Guadagni PD e Computed Torque

%[1 -> PD]  [2 -> Computed Torque]
controller = 2;

Kp_PD = 0.5*eye(6);
Kv_PD = 0.1*eye(6);

Kp_CT = 10*eye(6);
Kv_CT = 10*eye(6);

%% Backstepping

Lambda_BS = diag([0.25,0.25,0.25,0.25,0.25,0.25]);
Ks_BS = diag([15,15,15,0.1,0.1,0.1]);
