clear all
close all

%% Constants
J_l = 80;
Tl = 500;
r = 50;

%% Design parameters
omega = 10;
zeta = 1/sqrt(2);

%% Simulation parameters
Tfinal = 20;
dt = 0.01;

t = 0:dt:Tfinal;
theta_d = sin(t) + cos(2*t);


