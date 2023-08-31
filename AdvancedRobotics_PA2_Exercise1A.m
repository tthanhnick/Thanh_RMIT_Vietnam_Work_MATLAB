%MANU2478 -  Practical Assessment 2
%Course: Advanced Robotics. 
%Nguyen Tien Thanh - S3818111
clearvars
close all
clc
%%Exercise 1 - MATLAB Script
%Implement the Recursive Newton-Euler Formulation
% geometry parameters and masses
syms g L1 L2 m1 m2 
P1C1 = [L1; 0; 0]; % Position of center C1 seen in frame {1}
P12  = [L1; 0; 0]; % Position of the origin of frame {2} seen in frame {1}
P2C2 = [L2; 0; 0]; % Position of center C2 seen in frame {2}

% joint angles, velocities and accelerations (symbolic variables)
syms c1 s1 c2 s2 theta_dot1 theta_dot2 theta_ddot1 theta_ddot2

% rotation matrices between successive links 
R10 = [c1 s1 0; -s1 c1 0; 0 0 1];
R21 = [c2 0 s2; -s2 0 c2; 0 -1 0]; 
%Ourward iterations for propagating velocities and accelerations
% We start with
vdot00 = [0; 0; g];

% The outward interations for link 1
omega11     = [0; 0; theta_dot1]
omega_dot11 = [0; 0; theta_ddot1]

vdot11 = R10*vdot00
vdot1C1 = vdot11 + cross(omega_dot11,P1C1) + ...
                   cross(omega11,cross(omega11,P1C1))
F11 = m1*vdot1C1
% The outward interations for link 2
omega22 = R21*omega11 + theta_dot2*[0;0;1]
omega_dot22 = R21*omega_dot11 + cross(R21*omega11,theta_dot2*[0;0;1]) + ...
              theta_ddot2*[0;0;1]
vdot22 = R21*vdot11 + R21*(cross(omega_dot11,P12) + cross(omega11,cross(omega11,P12)))
vdot2C2 = vdot22 + cross(omega_dot22,P2C2) + ...
                   cross(omega22,cross(omega22,P2C2))
F22 = m2*vdot2C2
%Inward iterations for propagating forces
% The end-effector is not in contact with the environment, we start with
% zero vectors
f33 = zeros(3,1);
n33 = zeros(3,1);

% The inward iteration for link 2
R23 = eye(3); % frames {2} and {3} have the same orientation
f22 = R23*f33 + F22
n22 = R23*n33 + cross(P2C2,F22)
% Required torque at joint 2
tau2 = n22(3)
% The inward iteration for link 1
R12 = [c2 -s2 0; 0 0 -1; s2 c2 0]; 
f11 = R12*f22 + F11
n11 = R12*n22 + cross(P1C1,F11) + cross(P12,R12*f22)
% Required torque at joint 1
tau1 = n11(3)
%Simplification 
% Further simpification at each joint
T1=simplifyFraction(tau1)
T2=simplifyFraction(tau2)
